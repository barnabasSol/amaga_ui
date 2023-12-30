import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'jwt_event.dart';
part 'jwt_state.dart';

class JwtBloc extends Bloc<JwtEvent, JwtState> {
  JwtBloc() : super(JwtInitial()) {
    on<JwtEvent>((event, emit) {});
  }
}
