// ignore_for_file: unused_local_variable, non_constant_identifier_names
import 'package:amaga/services/base_url.dart';
import 'package:amaga/shared/exceptions/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:amaga/models/auth_response.dart';
import 'package:amaga/services/contracts/auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<AuthResponse> loginUser(String credential, String password) async {
    const String route = "$baseUrl/auth/login";
    Dio dio = Dio();
    dio.options.connectTimeout =
        const Duration(seconds: 10); // Set timeout to 10 seconds

    try {
      final response = await dio.post(
        route,
        data: {
          'username': credential,
          'password': password,
        },
      );
      var auth_obj = AuthResponse.fromJson(response.data);
      return AuthResponse(
        token: auth_obj.token,
        role: auth_obj.role,
        isSuccess: true,
        message: '',
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return AuthResponse(
            token: '',
            role: '',
            isSuccess: false,
            message: "Connection timed out");
      } else if (e.type == DioExceptionType.connectionError) {
        return AuthResponse(
            token: '',
            role: '',
            isSuccess: false,
            message: "Network problem occurred");
      } else if (e.response != null) {
        var errorResponse = ApiError.fromJson(e.response!.data);
        return AuthResponse(
            token: '',
            role: '',
            isSuccess: false,
            message: errorResponse.message);
      } else {
        return AuthResponse(
            token: '',
            role: '',
            isSuccess: false,
            message: "Client error occurred: $e");
      }
    } catch (e) {
      return AuthResponse(
          token: '',
          role: '',
          isSuccess: false,
          message: "Unexpected error occurred: $e");
    }
  }
}
