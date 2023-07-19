part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {}

class SignUpInitial extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpSuccessState extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpWithGoogleSuccessState extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpWithAppleSuccessState extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorState extends SignUpState {
  final String errMessage;

  ErrorState({required this.errMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}

class SocialFailureState extends SignUpState {
  final String errMessage;

  SocialFailureState({required this.errMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}

class LoadingState extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OpenSignInScreenState extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CheckAgreeState extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotCheckAgreeState extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ValidateRegisterState extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotValidateRegisterState extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
