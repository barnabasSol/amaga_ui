class AuthResponse {
  final bool? isSuccess;
  final String? message;
  final String token;
  final String role;

  AuthResponse(this.isSuccess, this.message, {required this.token, required this.role});
}
