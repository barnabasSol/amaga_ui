import 'package:amaga/features/auth/bloc/auth_bloc.dart';
import 'package:amaga/features/auth/data/dataprovider/auth_provider.dart';
import 'package:amaga/features/auth/data/repository/auth_repository.dart';
import 'package:amaga/features/auth/presentation/pages/login_page.dart';
import 'package:amaga/features/register/bloc/register_bloc.dart';
import 'package:amaga/features/register/data/dataprovider/register_provider.dart';
import 'package:amaga/features/register/data/repository/register_repository.dart';
import 'package:amaga/shared/interceptor/custom_interceptor.dart';
import 'package:amaga/shared/routes/routes.dart';
import 'package:amaga/shared/themes/themes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    dio.interceptors.add(CustomInterceptor());
    dio.options.connectTimeout = const Duration(seconds: 7);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => AuthRepository(AuthProvider(dio))),
        RepositoryProvider(
            create: (context) => RegisterRepository(RegisterProvider(dio))),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              context.read<AuthRepository>(),
              const FlutterSecureStorage(),
            ),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(
              context.read<RegisterRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Amaga',
          debugShowCheckedModeBanner: false,
          routes: app_routes,
          theme: app_theme,
          home: const LoginPage(),
        ),
      ),
    );
  }
}
