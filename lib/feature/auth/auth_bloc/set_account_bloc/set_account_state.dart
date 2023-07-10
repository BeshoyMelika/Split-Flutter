part of 'set_account_bloc.dart';

abstract class SetAccountState {}

class SetAccountInitial extends SetAccountState {}

class SubmitSetAccountSuccess extends SetAccountState {}

class SubmitSetAccountLoading extends SetAccountState {}

class SubmitSetAccountFailure extends SetAccountState {}
