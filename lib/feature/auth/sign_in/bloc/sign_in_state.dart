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

class SignInFailureState extends SignInState {
  final String errMessage;

  SignInFailureState({required this.errMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}

class SignInLoadingState extends SignInState {
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
