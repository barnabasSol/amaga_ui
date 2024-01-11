part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

//customers state
final class RegisterCustomersFetchingLoading extends RegisterState {}

final class RegisterCustomersFetchingSuccess extends RegisterState {}

final class RegisterCustomersFetchingFailed extends RegisterState {}

final class RegisterAddingCustomerLoading extends RegisterState {}

final class RegisterAddingCustomerSuccess extends RegisterState {}

final class RegisterAddingCustomerFailed extends RegisterState {}

//cylinders state
final class RegisterAddingCylinderLoading extends RegisterState {}

final class RegisterAddingCylinderSuccess extends RegisterState {}

final class RegisterAddingCylinderFailed extends RegisterState {}
