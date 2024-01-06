class LoginDto {
  final String credential;
  final String password;

  LoginDto({
    required this.credential,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': credential,
      'password': password,
    };
  }

  static LoginDto fromJson(Map<String, dynamic> json) {
    return LoginDto(
      credential: json['username'],
      password: json['password'],
    );
  }
}
