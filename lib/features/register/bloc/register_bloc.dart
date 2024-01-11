import 'package:amaga/features/register/data/repository/register_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  // ignore: unused_field
  final RegisterRepository _registerRepository;
  RegisterBloc(this._registerRepository) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
  }
}
