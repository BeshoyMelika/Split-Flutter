part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable {}

class LoginEvent extends SignInEvent {
  final String email, password;

  LoginEvent({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

class LoginWithGoogleEvent extends SignInEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginWithAppleEvent extends SignInEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ForgetPasswordEvent extends SignInEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpScreenEvent extends SignInEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ValidateLoginFormEvent extends SignInEvent {
  final GlobalKey<FormState> formKey;

  ValidateLoginFormEvent({required this.formKey});

  @override
  // TODO: implement props
  List<Object?> get props => [formKey];
}
