part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {}

class SubmitPasswordEvent extends ResetPasswordEvent {
  final String newPassword, confirmNewPassword;

  SubmitPasswordEvent(
      {required this.newPassword, required this.confirmNewPassword});

  @override
  // TODO: implement props
  List<Object?> get props => [newPassword, confirmNewPassword];
}

class ValidateResetPasswordFormEvent extends ResetPasswordEvent {
  final GlobalKey<FormState> formKey;

  ValidateResetPasswordFormEvent({required this.formKey});

  @override
  // TODO: implement props
  List<Object?> get props => [formKey];
}
