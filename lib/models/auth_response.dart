import 'dart:convert';

class AuthResponse {
  bool? isSuccess;
  String? message;
  final String token;
  final String role;

  AuthResponse(
    this.isSuccess,
    this.message, {
    required this.token,
    required this.role,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      json['isSuccess'],
      json['message'],
      token: json['token'],
      role: json['role'],
    );
  }

  static AuthResponse fromJsonString(String jsonString) {
    Map<String, dynamic> newMap = jsonDecode(jsonString);
    return AuthResponse.fromJson(newMap);
  }
}
