part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class SubmitPasswordSuccessState extends ResetPasswordState {}

class SubmitPasswordFailureState extends ResetPasswordState {}

class SubmitPasswordLoadingState extends ResetPasswordState {}
