import 'package:amaga/features/auth/bloc/auth_bloc.dart';
import 'package:amaga/features/auth/data/dataprovider/auth_provider.dart';
import 'package:amaga/features/auth/data/repository/auth_repository.dart';
import 'package:amaga/features/auth/presentation/pages/login_page.dart';
import 'package:amaga/shared/routes/routes.dart';
import 'package:amaga/shared/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            AuthProvider(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              context.read<AuthRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
            title: 'Amaga',
            debugShowCheckedModeBanner: false,
            routes: app_routes,
            theme: app_theme,
            home: const LoginPage()),
      ),
    );
  }
}
