import 'dart:convert';
import 'package:amaga/features/auth/data/dataprovider/auth_provider.dart';
import 'package:amaga/models/auth_response.dart';
import 'package:amaga/models/dtos/login_dto.dart';
import 'package:amaga/shared/exceptions/internet_exceptions.dart';

class AuthRepository {
  final AuthProvider _authProvider;

  AuthRepository(this._authProvider);

  Future<AuthResponse> loginUser(LoginDto loginDto) async {
    try {
      final String response = await _authProvider.loginUserRaw(loginDto);
      final authData = AuthResponse.fromJson(jsonDecode(response));
      authData.isSuccess = true;
      return authData;
    } on TimeoutException {
      return AuthResponse(
        isSuccess: false,
        message: TimeoutException().toString(),
        token: '',
        role: '',
      );
    } on NetworkException {
      return AuthResponse(
        isSuccess: false,
        message: NetworkException().toString(),
        token: '',
        role: '',
      );
    } on UnknownException {
      return AuthResponse(
        isSuccess: false,
        message: UnknownException().toString(),
        token: '',
        role: '',
      );
    } catch (e) {
      return AuthResponse(
        isSuccess: false,
        message: e.toString(),
        token: '',
        role: '',
      );
    }
  }
}
