import 'package:amaga/features/auth/bloc/auth_bloc.dart';
import 'package:amaga/features/auth/pages/login_page.dart';
import 'package:amaga/shared/routes/routes.dart';
import 'package:amaga/shared/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        title: 'Amaga',
        debugShowCheckedModeBanner: false,
        routes: app_routes,
        theme: app_theme,
        home: const LoginPage(),
      ),
    );
  }
}
