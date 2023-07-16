part of 'set_account_bloc.dart';

abstract class SetAccountEvent {}

class SubmitSetAccountEvent extends SetAccountEvent {
  final String username;

  SubmitSetAccountEvent({required this.username});
}

class ValidateSetAccountFormEvent extends SetAccountEvent {
  final GlobalKey<FormState> formKey;

  ValidateSetAccountFormEvent({required this.formKey});
}
