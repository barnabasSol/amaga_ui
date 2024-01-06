import 'package:amaga/features/auth/bloc/auth_bloc.dart';
import 'package:amaga/features/exchange/pages/edit_stock_cylinder.dart';
import 'package:amaga/shared/widgets/animated_line.dart';
import 'package:amaga/features/auth/presentation/widgets/password_widget.dart';
import 'package:amaga/models/dtos/login_dto.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopLoginPage extends StatefulWidget {
  const DesktopLoginPage({super.key});

  @override
  State<DesktopLoginPage> createState() => _DesktoLoginPagepState();
}

class _DesktoLoginPagepState extends State<DesktopLoginPage> {
  final credcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          color: const Color(0xffF1F1F1),
          child: Center(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: const Color(0xffF1F1F1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-1, -1),
                            blurRadius: 1,
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 3),
                            blurRadius: 1,
                            spreadRadius: 0.5,
                          )
                        ]),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(left: 8),
                            alignment: Alignment.topCenter,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome back!',
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  AnimatedLine(
                                    lineWidth: 220,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    height: 54,
                                    margin: const EdgeInsets.only(
                                        left: 56, right: 56),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  CustomInput(
                                    label: "Username",
                                    input_controller: credcontroller,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              Stack(alignment: Alignment.topCenter, children: [
                                Container(
                                  height: 54,
                                  margin: const EdgeInsets.only(
                                      left: 56, right: 56),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                PasswordInput(
                                  input_controller: passwordcontroller,
                                ),
                              ]),
                              const SizedBox(
                                height: 30,
                              ),
                              BlocConsumer<AuthBloc, AuthState>(
                                listener: (context, state) {
                                  if (state is AuthFailed) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red[800],
                                      content: Text(state.error_msg),
                                      duration: const Duration(seconds: 3),
                                      behavior: SnackBarBehavior.floating,
                                    ));
                                  }
                                  if (state is AuthSuccess) {
                                    if (state.authResponse.role.toLowerCase() ==
                                        "tester") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ShowStockCylinder(),
                                        ),
                                      );
                                    }
                                  }
                                },
                                builder: (context, state) {
                                  if (state is AuthLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  return CustomButton(
                                    onClicked: () {
                                      BlocProvider.of<AuthBloc>(context).add(
                                        AuthLoginPressed(
                                          loginDto: LoginDto(
                                              credential:
                                                  credcontroller.text.trim(),
                                              password: passwordcontroller.text
                                                  .trim()),
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    credcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
}
