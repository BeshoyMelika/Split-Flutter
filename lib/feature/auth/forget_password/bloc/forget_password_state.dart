part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPasswordState extends Equatable {}

class ForgetPasswordInitial extends ForgetPasswordState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetPasswordSuccessState extends ForgetPasswordState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetPasswordLoadingState extends ForgetPasswordState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetPasswordFailureState extends ForgetPasswordState {
  final String errMessage;

  ResetPasswordFailureState({required this.errMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}

class ValidateForgetPasswordFormState extends ForgetPasswordState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotValidateForgetPasswordFormState extends ForgetPasswordState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
