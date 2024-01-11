part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class RegisterCustomersLoaded extends RegisterEvent {}

final class RegisterCustomerAddClicked extends RegisterEvent {}

final class RegisterCustomerSearched extends RegisterEvent {}

