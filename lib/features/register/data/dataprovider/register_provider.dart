import 'dart:convert';
import 'package:amaga/services/base_url.dart';
import 'package:amaga/shared/exceptions/internet_exceptions.dart';
import 'package:dio/dio.dart';

class RegisterProvider {
  final Dio dio;

  RegisterProvider(this.dio);
  Future<String> getRegisterCustomers() async {
    const String route = "$baseUrl/customers";
    try {
      final response = await dio.get(route);
      return jsonEncode(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        var serverError = jsonDecode(e.response.toString());
        if (e.response?.statusCode == 401) {
          throw UnauthorizedException(
              message: serverError['message'].toString());
        } else {
          throw BadRequestException(message: serverError['message'].toString());
        }
      } else if (e.type == DioExceptionType.connectionError) {
        throw NetworkException();
      } else if (e.type == DioExceptionType.connectionTimeout) {
        throw TimeoutException();
      } else {
        throw UnknownException();
      }
    } catch (e) {
      throw UnknownException(
          message: 'Unexpected error occurred: ${e.toString()}');
    }
  }
}
