// ignore_for_file: unused_local_variable
import 'package:dio/dio.dart';

import 'package:amaga/models/auth_response.dart';
import 'package:amaga/services/contracts/auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<AuthResponse> loginUser(String credential, String password) async {
    const String route = "/auth/login";
    Dio dio;
    throw UnimplementedError();
  }
}
