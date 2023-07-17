part of 'set_account_bloc.dart';

abstract class SetAccountEvent extends Equatable {}

class SubmitSetAccountEvent extends SetAccountEvent {
  final String username;

  SubmitSetAccountEvent({required this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [username];
}

class ValidateSetAccountFormEvent extends SetAccountEvent {
  final GlobalKey<FormState> formKey;

  ValidateSetAccountFormEvent({required this.formKey});

  @override
  // TODO: implement props
  List<Object?> get props => [formKey];
}
