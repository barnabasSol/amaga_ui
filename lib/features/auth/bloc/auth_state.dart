// ignore_for_file: non_constant_identifier_names
part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthResponse authResponse;

  AuthSuccess({required this.authResponse});
}

final class AuthFailed extends AuthState {
  final String error_msg;

  AuthFailed({required this.error_msg});
}

final class AuthLogOutLoading extends AuthState {}

final class AuthLogOutSuccess extends AuthState {}

final class AuthLogOutFailed extends AuthState {
  final String error_msg;

  AuthLogOutFailed({required this.error_msg});
}
