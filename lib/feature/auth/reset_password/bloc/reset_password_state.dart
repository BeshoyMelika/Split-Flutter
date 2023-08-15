part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {}

class ResetPasswordInitial extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}

class SubmitPasswordSuccessState extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}

class SubmitPasswordFailureState extends ResetPasswordState {
  final String errMessage;

  SubmitPasswordFailureState({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}

class SubmitPasswordLoadingState extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}

class ValidateResetPasswordFormState extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}

class NotValidateResetPasswordFormState extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}
