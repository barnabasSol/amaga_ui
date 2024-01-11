part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginPressed extends AuthEvent {
  final LoginDto loginDto;

  AuthLoginPressed({required this.loginDto});
}

final class AuthLogOutPressed extends AuthEvent {}
