import 'dart:convert';
import 'package:amaga/models/dtos/login_dto.dart';
import 'package:amaga/services/base_url.dart';
import 'package:amaga/shared/exceptions/internet_exceptions.dart';
import 'package:dio/dio.dart';

class AuthProvider {
  final Dio dio;

  AuthProvider(this.dio);
  Future<String> loginUserProvider(LoginDto loginDto) async {
    const String route = "$baseUrl/auth/login";
    try {
      final response = await dio.post(
        route,
        data: loginDto.toJson(),
      );
      return jsonEncode(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        var serverError = jsonDecode(e.response.toString());
        if (e.response?.statusCode == 401) {
          throw UnauthorizedException();
        } else {
          throw BadRequestException(
            message: serverError['message'].toString(),
          );
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
