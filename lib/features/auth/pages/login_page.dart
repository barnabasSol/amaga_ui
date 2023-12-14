import 'package:amaga/features/auth/widgets/input_widget.dart';
import 'package:amaga/features/auth/widgets/line.dart';
import 'package:amaga/features/auth/widgets/login_button.dart';
import 'package:amaga/features/auth/widgets/password_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    Line()
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
                const CredentialInput(
                  label: "Email or Phone Number",
                ),
                const SizedBox(
                  height: 30,
                ),
                const PasswordInput(
                ),
                const SizedBox(
                  height: 30,
                ),
                LoginButton(
                  onClicked: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/registerpage');
                  },
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
