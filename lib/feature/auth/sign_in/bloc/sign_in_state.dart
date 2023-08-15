part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInSuccessState extends SignInState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends SignInState {
  final String errMessage;

  ErrorState({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}

class LoadingState extends SignInState {
  @override
  List<Object?> get props => [];
}

class OpenForgetPasswordScreenState extends SignInState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class OpenSignUpScreenState extends SignInState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ValidateLoginState extends SignInState {
  @override
  List<Object?> get props => [];
}

class NotValidateLoginState extends SignInState {
  @override
  List<Object?> get props => [];
}
