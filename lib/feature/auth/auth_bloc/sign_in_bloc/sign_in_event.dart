part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class LoginEvent extends SignInEvent {}

class LoginWithGoogleEvent extends SignInEvent {}

class LoginWithAppleEvent extends SignInEvent {}

class ForgetPasswordEvent extends SignInEvent {}

class SignUpScreenEvent extends SignInEvent {}
