part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent {}

class SubmitPasswordEvent extends ResetPasswordEvent {
  final String newPassword, confirmNewPassword;

  SubmitPasswordEvent(
      {required this.newPassword, required this.confirmNewPassword});
}

class ValidateResetPasswordFormEvent extends ResetPasswordEvent {
  final GlobalKey<FormState> formKey;

  ValidateResetPasswordFormEvent({required this.formKey});
}
