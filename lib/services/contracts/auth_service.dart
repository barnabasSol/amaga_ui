import 'package:amaga/models/auth_response.dart';

abstract class AuthService {
  Future<AuthResponse> loginUser(String credential, String password);
}
