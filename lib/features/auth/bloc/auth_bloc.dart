import 'package:amaga/features/auth/data/repository/auth_repository.dart';
import 'package:amaga/models/auth_response.dart';
import 'package:amaga/models/dtos/login_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final FlutterSecureStorage _storage;

  AuthBloc(this._authRepository, this._storage) : super(AuthInitial()) {
    on<AuthLoginPressed>(
      (event, emit) async {
        emit(AuthLoading());
        final credential = event.loginDto.credential;
        final password = event.loginDto.password;
        if (credential.isEmpty || password.isEmpty) {
          final errorMsg = credential.isEmpty
              ? 'Username can\'t be empty'
              : 'Password can\'t be empty';
          return emit(AuthFailed(error_msg: errorMsg));
        }
        final authResponse = await _authRepository.loginUser(event.loginDto);
        if (authResponse.isSuccess!) {
          try {
            await _storage.write(key: 'token', value: authResponse.token);
          } catch (e) {
            return emit(
                AuthFailed(error_msg: "couldn't store the security token"));
          }
          return emit(AuthSuccess(authResponse: authResponse));
        }
        return emit(AuthFailed(error_msg: authResponse.message!));
      },
    );

    on<AuthLogOutPressed>(
      (event, emit) async {
        emit(AuthLogOutLoading());
        try {
          await _storage.delete(key: 'token');
          return emit(AuthLogOutSuccess());
        } catch (e) {
          return emit(AuthLogOutFailed(error_msg: "failed to logout"));
        }
      },
    );
  }
}
