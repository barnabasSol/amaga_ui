import 'package:amaga/features/auth/pages/login_page.dart';
import 'package:amaga/features/exit/pages/exit_main_page.dart';
import 'package:amaga/shared/routes/routes.dart';
import 'package:amaga/shared/themes/themes.dart';
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
      routes: app_routes,
      theme: app_theme,
      home: const LoginPage(),
    );
  }
}
