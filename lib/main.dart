import 'package:amaga/features/auth/pages/login_page.dart';
import 'package:amaga/features/registerer/pages/add_cutomer_page.dart';
import 'package:amaga/features/registerer/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amaga',
        debugShowCheckedModeBanner: false,
        routes: {
          '/registerpage': (context) => const RegisterPage(),
          '/createuserpage': (context) => const AddCustomerpage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 8, 138, 73),
            primary: const Color.fromARGB(255, 36, 151, 93),
            surface: const Color.fromARGB(
                255, 233, 232, 232), // light gray background
          ),
        ),
        home: const LoginPage());
  }
}
