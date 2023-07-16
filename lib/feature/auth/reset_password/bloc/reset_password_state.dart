part of 'reset_password_bloc.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class SubmitPasswordSuccessState extends ResetPasswordState {}

class SubmitPasswordFailureState extends ResetPasswordState {}

class SubmitPasswordLoadingState extends ResetPasswordState {}

class ValidateResetPasswordFormState extends ResetPasswordState {}

class NotValidateResetPasswordFormState extends ResetPasswordState {}
