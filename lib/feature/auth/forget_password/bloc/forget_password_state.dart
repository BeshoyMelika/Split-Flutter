part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ResetPasswordSuccessState extends ForgetPasswordState {}

class ResetPasswordLoadingState extends ForgetPasswordState {}

class ResetPasswordFailureState extends ForgetPasswordState {}

class ValidateForgetPasswordFormState extends ForgetPasswordState {}

class NotValidateForgetPasswordFormState extends ForgetPasswordState {}
