// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/auth/repository/contracts/login_logic.dart';
import 'package:amaga/features/auth/repository/login_logic_impl.dart';
import 'package:amaga/features/auth/widgets/line.dart';
import 'package:amaga/features/auth/widgets/password_widget.dart';
import 'package:amaga/services/auth_service_impl.dart';
import 'package:amaga/services/contracts/auth_service.dart';
import 'package:amaga/shared/dtos/login_dto.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final cred_controller = TextEditingController();
  final password_controller = TextEditingController();
  final LoginLogic login_check = LoginLogicImpl();
  AuthService auth = AuthServiceImpl();
  bool processing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 8),
              alignment: Alignment.bottomLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome!',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                    ),
                    Line(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomInput(
                  label: "Email or Phone Number",
                  input_controller: cred_controller,
                ),
                const SizedBox(
                  height: 17,
                ),
                PasswordInput(
                  input_controller: password_controller,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onClicked: handleLogin,
                  label: 'Login',
                  width: 350,
                  height: 60,
                  isLoading: processing,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handleLogin() async {
    LoginDto login_info = LoginDto(
      credential: cred_controller.text,
      password: password_controller.text,
    );
    setState(() {
      processing = true;
    });
    if (login_check.loginValidate(
      cred_controller.text,
      password_controller.text,
    )) {
      var response = await auth.loginUser(login_info.credential, login_info.password);
      if (response.isSuccess!) {
        setState(() {
          login_check.handleSuccessfulLogin(context, login_info, response);
        });
      } else {
        setState(() {
          login_check.handleFailedLogin(context, login_info, response.message!);
          processing = false;
        });
      }
    } else {
      setState(() {
        login_check.handleFailedLogin(context, login_info, "invalid input");
        processing = false;
      });
    }
  }
}
