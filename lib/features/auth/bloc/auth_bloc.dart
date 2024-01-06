import 'package:amaga/features/auth/data/repository/auth_repository.dart';
import 'package:amaga/models/auth_response.dart';
import 'package:amaga/models/dtos/login_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthLoginPressed>(
      (event, emit) async {
        try {
          emit(AuthLoading());
          if (event.loginDto.credential.isEmpty) {
            return emit(AuthFailed(error_msg: 'username cant be empty'));
          }

          if (event.loginDto.password.isEmpty) {
            return emit(AuthFailed(error_msg: 'password cant be empty'));
          }

          AuthResponse authResponse =
              await _authRepository.loginUser(event.loginDto);

          if (authResponse.isSuccess!) {
            return emit(AuthSuccess(authResponse: authResponse));
          } else {
            return emit(AuthFailed(error_msg: authResponse.message!));
          }
        } catch (error) {
          emit(AuthFailed(error_msg: 'An error occurred during login.'));
        }
      },
    );
  }
}
