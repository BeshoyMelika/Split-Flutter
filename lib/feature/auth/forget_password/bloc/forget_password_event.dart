part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPasswordEvent extends Equatable {}

class ResetPasswordEvent extends ForgetPasswordEvent {
  final String email;

  ResetPasswordEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class ValidateForgetPasswordFormEvent extends ForgetPasswordEvent {
  final GlobalKey<FormState> formKey;

  ValidateForgetPasswordFormEvent({required this.formKey});

  @override
  List<Object?> get props => [formKey];
}
