class LoginDto {
  final String credential;
  final String password;

  LoginDto({
    required this.credential,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'credential': credential,
      'password': password,
    };
  }

  static LoginDto fromJson(Map<String, dynamic> json) {
    return LoginDto(
      credential: json['credential'],
      password: json['password'],
    );
  }
}
