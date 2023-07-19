part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInSuccessState extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorState extends SignInState {
  final String errMessage;

  ErrorState({required this.errMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}

class LoadingState extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OpenForgetPasswordScreenState extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OpenSignUpScreenState extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ValidateLoginState extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotValidateLoginState extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
