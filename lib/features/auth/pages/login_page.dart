// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/auth/repository/contracts/login_logic.dart';
import 'package:amaga/features/auth/repository/login_logic_impl.dart';
import 'package:amaga/shared/dtos/login_dto.dart';
import 'package:amaga/shared/widgets/custom_input.dart';
import 'package:amaga/features/auth/widgets/line.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/features/auth/widgets/password_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cred_controller = TextEditingController();
  final password_controller = TextEditingController();
  final LoginLogic login_check = LoginLogicImpl();

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        kIsWeb || (Theme.of(context).platform == TargetPlatform.windows);

    if (isDesktop) {
      return const Scaffold(
        body: Center(
          child: Text('This is a PC'),
        ),
      );
    }

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
                  onClicked: () {
                    LoginDto login_info = LoginDto(
                        credential: cred_controller.text,
                        password: password_controller.text);

                    if (login_check.loginValidate(
                      cred_controller.text,
                      password_controller.text,
                    )) {
                      setState(() {
                        login_check.handleSuccessfulLogin(context, login_info);
                      });
                    } else {
                      setState(() {
                        login_check.handleFailedLogin(context, login_info);
                      });
                    }
                  },
                  label: 'Login',
                  width: 350,
                  height: 60,
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
}
