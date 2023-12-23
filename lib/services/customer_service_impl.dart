import 'dart:convert';
import 'package:amaga/models/api_data_reponse.dart';
import 'package:amaga/models/customer.dart';
import 'package:amaga/services/base_url.dart';
import 'package:amaga/services/contracts/customer_service.dart';
import 'package:amaga/shared/exceptions/api_exception.dart';
import 'package:dio/dio.dart';

class CustomerServiceImpl implements CustomerService {
  @override
  Future<ApiDataResponse<List<Customer>>> getCustomers(String token) async {
    const String route = "$baseUrl/customers";
    Dio dio = Dio();
    try {
      final response = await dio.get(
        route,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Iterable jsonResponse = json.decode(response.data);
      List<Customer> customers = List<Customer>.from(
          jsonResponse.map((model) => Customer.fromJson(model)));
      return ApiDataResponse<List<Customer>>(
        isSuccess: true,
        message: 'Successfully loaded customers',
        data: customers,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        var errorResponse = ApiError.fromJson(e.response!.data);
        return ApiDataResponse<List<Customer>>(
          isSuccess: false,
          message: 'Failed to load customers: ${errorResponse.message}',
          data: [],
        );
      } else {
        return ApiDataResponse<List<Customer>>(
          isSuccess: false,
          message: 'Client error occurred: $e',
          data: [],
        );
      }
    } catch (e) {
      return ApiDataResponse<List<Customer>>(
        isSuccess: false,
        message: 'Unexpected error occurred: $e',
        data: [],
      );
    }
  }
}
