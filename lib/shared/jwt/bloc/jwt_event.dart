part of 'jwt_bloc.dart';

@immutable
sealed class JwtEvent {}

final class JwtAddSecureStorage extends JwtEvent {
  final String token;

  JwtAddSecureStorage({required this.token});
}

final class JwtInvalidateToken extends JwtEvent {
  final String token;

  JwtInvalidateToken({required this.token});
}
