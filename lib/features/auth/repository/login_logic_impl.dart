// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/auth/repository/contracts/login_logic.dart';
import 'package:amaga/features/registerer/pages/register_page.dart';
import 'package:amaga/features/tester/pages/tester_page.dart';
import 'package:amaga/models/auth_response.dart';
import 'package:amaga/shared/dtos/login_dto.dart';
import 'package:flutter/material.dart';

class LoginLogicImpl implements LoginLogic {
  bool isSnackBarActive = false;
  @override
  bool loginValidate(String credential, String password) {
    {
      if (credential == "abebe" && password == "123") {
        return true;
      }
      return false;
    }
  }

  @override
  AuthResponse authResponse(String credential, String password) {
    String role = "tester";
    String token = "sldfbslhbdlshbdbgsldfg";
    return AuthResponse(true, "", token: token, role: role);
  }

  @override
  void handleSuccessfulLogin(BuildContext context, LoginDto login_info) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    isSnackBarActive = false;
    Navigator.pop(context);
    AuthResponse response =
        authResponse(login_info.credential, login_info.password);
    if (response.role == "register") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(token: response.token),
        ),
      );
    } else if (response.role == "tester") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TesterMainPage(token: response.token),
        ),
      );
    }
  }

  @override
  void handleFailedLogin(BuildContext context, LoginDto login_info) {
    if (!isSnackBarActive) {
      isSnackBarActive = true;
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              backgroundColor: Colors.red[800],
              content: const Text('incorrect credential or password'),
              duration: const Duration(seconds: 3),
              onVisible: () {
                isSnackBarActive = true;
              },
              behavior: SnackBarBehavior.floating,
            ),
          )
          .closed
          .then((reason) {
        isSnackBarActive = false;
      });
    }
  }
}
