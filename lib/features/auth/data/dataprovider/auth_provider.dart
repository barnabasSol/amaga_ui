import 'dart:convert';
import 'package:amaga/models/dtos/login_dto.dart';
import 'package:amaga/services/base_url.dart';
import 'package:amaga/shared/exceptions/internet_exceptions.dart';
import 'package:dio/dio.dart';

class AuthProvider {
  Future<String> loginUserRaw(LoginDto loginDto) async {
    const String route = "$baseUrl/auth/login";
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 7);
    try {
      final response = await dio.post(
        route,
        data: loginDto.toJson(),
      );
      return jsonEncode(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        var serverError = jsonDecode(e.response.toString());
        throw BadRequestException(message: serverError['message']);
      } else if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw NetworkException();
      } else {
        throw UnknownException();
      }
    } catch (e) {
      throw UnknownException(
          message: 'Unexpected error occurred: ${e.toString()}');
    }
  }
}
