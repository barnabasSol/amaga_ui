class AuthResponse {
  bool? isSuccess;
  String? message;
  final String token;
  final String role;

  AuthResponse({
    this.message,
    this.isSuccess,
    required this.token,
    required this.role,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      role: json['role'],
    );
  }
}
