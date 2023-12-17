// ignore_for_file: non_constant_identifier_names

import 'package:amaga/models/auth_response.dart';
import 'package:amaga/shared/dtos/login_dto.dart';
import 'package:flutter/material.dart';

abstract class LoginLogic {
  bool loginValidate(String credential, String password);
  AuthResponse authResponse(String credential, String Password);
  void handleSuccessfulLogin(BuildContext context, LoginDto login_info);
  void handleFailedLogin(BuildContext context, LoginDto login_info);
}