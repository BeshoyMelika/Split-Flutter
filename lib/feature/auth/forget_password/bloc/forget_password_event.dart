part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPasswordEvent {}

class ResetPasswordEvent extends ForgetPasswordEvent {
  final String email;

  ResetPasswordEvent({required this.email});
}

class ValidateForgetPasswordFormEvent extends ForgetPasswordEvent {
  final GlobalKey<FormState> formKey;

  ValidateForgetPasswordFormEvent({required this.formKey});
}
