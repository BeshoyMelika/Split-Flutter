part of 'set_account_bloc.dart';

abstract class SetAccountState {}

class SetAccountInitial extends SetAccountState {}

class SubmitSetAccountSuccessState extends SetAccountState {}

class SubmitSetAccountLoadingState extends SetAccountState {}

class SubmitSetAccountFailureState extends SetAccountState {}

class ValidateSetAccountState extends SetAccountState {}

class NotValidateSetAccountState extends SetAccountState {}
