// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/auth/repository/contracts/login_logic.dart';
import 'package:amaga/features/fill/pages/fill_main_page.dart';
import 'package:amaga/features/maintain/pages/maintain_main_page.dart';
import 'package:amaga/features/registerer/pages/register_page.dart';
import 'package:amaga/features/tester/pages/tester_page.dart';
import 'package:amaga/models/auth_response.dart';
import 'package:amaga/shared/dtos/login_dto.dart';
import 'package:flutter/material.dart';

class LoginLogicImpl implements LoginLogic {
  bool isSnackBarActive = false;
  @override
  bool loginValidate(String credential, String password) {
    if (credential.isEmpty || password.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void handleSuccessfulLogin(
    BuildContext context,
    LoginDto login_info,
    AuthResponse response,
  ) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    isSnackBarActive = false;
    Navigator.pop(context);
    if (response.role.toLowerCase() == "register") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(token: response.token),
        ),
      );
    } else if (response.role.toLowerCase() == "tester") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TesterMainPage(token: response.token),
        ),
      );
    } else if (response.role.toLowerCase() == "maintain") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MaintainMainPage(token: response.token),
        ),
      );
    } else if (response.role.toLowerCase() == "fill") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FillerMainPage(token: response.token),
        ),
      );
    }
  }

  @override
  void handleFailedLogin(
    BuildContext context,
    LoginDto login_info,
    String errMsg,
  ) {
    if (!isSnackBarActive) {
      isSnackBarActive = true;
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              backgroundColor: Colors.red[800],
              content: Text(errMsg),
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
