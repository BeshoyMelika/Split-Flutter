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

class SignUpFailureState extends SignUpState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}

class SignUpWithGoogleFailureState extends SignUpState {
  final String errMessage;

  SignUpWithGoogleFailureState({required this.errMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}

class SignUpWithAppleFailureState extends SignUpState {
  final String errMessage;

  SignUpWithAppleFailureState({required this.errMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}

class SignUpLoadingState extends SignUpState {
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
