import 'package:amaga/models/auth_response.dart';
import 'package:amaga/services/auth_service_impl.dart';
import 'package:amaga/services/contracts/auth_service.dart';
import 'package:amaga/models/dtos/login_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService = AuthServiceImpl();
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginPressed>((event, emit) async {
      try {
        emit(AuthLoading());
        if (event.loginDto.credential.isEmpty) {
          return emit(AuthFailed(error_msg: 'username cant be empty'));
        }

        if (event.loginDto.password.isEmpty) {
          return emit(AuthFailed(error_msg: 'password cant be empty'));
        }

        AuthResponse authResponse = await authService.loginUser(
          event.loginDto.credential,
          event.loginDto.password,
        );

        if (authResponse.isSuccess!) {
          return emit(AuthSuccess(authResponse: authResponse));
        } else {
          return emit(AuthFailed(error_msg: authResponse.message!));
        }
      } catch (error) {
        emit(AuthFailed(error_msg: 'An error occurred during login.'));
      }
    });
  }
}
