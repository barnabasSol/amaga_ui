part of 'jwt_bloc.dart';

@immutable
sealed class JwtState {}

final class JwtInitial extends JwtState {}

final class JwtValid extends JwtState {}

final class JwtInvalid extends JwtState {}
