part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class LoginEvent extends SignInEvent {
  final String email, password;

  LoginEvent({required this.email, required this.password});
}

class LoginWithGoogleEvent extends SignInEvent {}

class LoginWithAppleEvent extends SignInEvent {}

class ForgetPasswordEvent extends SignInEvent {}

class SignUpScreenEvent extends SignInEvent {}

class ValidateLoginFormEvent extends SignInEvent {
  final GlobalKey<FormState> formKey;

  ValidateLoginFormEvent({required this.formKey});
}
