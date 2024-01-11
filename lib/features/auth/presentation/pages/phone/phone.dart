// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/auth/bloc/auth_bloc.dart';
import 'package:amaga/features/auth/presentation/widgets/line.dart';
import 'package:amaga/features/auth/presentation/widgets/password_widget.dart';
import 'package:amaga/models/dtos/login_dto.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final cred_controller = TextEditingController();
  final password_controller = TextEditingController();
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
                  label: "Username",
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
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          dismissDirection: DismissDirection.endToStart,
                          backgroundColor: Colors.red[800],
                          content: Text(state.error_msg),
                          duration: const Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                    if (state is AuthSuccess) {
                      switch (state.authResponse.role) {
                        case "REGISTER":
                          Navigator.pushNamed(context, '/registermainpage');
                          break;
                        case "TESTER":
                          Navigator.pushNamed(context, '/testermainpage');
                          break;
                        case "MAINTEN":
                          Navigator.pushNamed(context, '/maintenmainpage');
                          break;
                        case "FILLER":
                          Navigator.pushNamed(context, '/fillermainpage');
                          break;
                        default:
                          break;
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      onClicked: () {
                        context.read<AuthBloc>().add(
                              AuthLoginPressed(
                                loginDto: LoginDto(
                                  credential: cred_controller.text.trim(),
                                  password: password_controller.text.trim(),
                                ),
                              ),
                            );
                      },
                      label: 'Login',
                      width: 350,
                      height: 60,
                    );
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

  @override
  void dispose() {
    cred_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }
}
