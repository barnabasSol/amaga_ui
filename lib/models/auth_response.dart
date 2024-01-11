class AuthResponse {
  bool? isSuccess;
  String? message;
  String? statusCode;
  final String token;
  final String role;

  AuthResponse({
    this.message,
    this.isSuccess,
    this.statusCode,
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
