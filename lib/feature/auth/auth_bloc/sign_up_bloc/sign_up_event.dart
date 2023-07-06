part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class RegisterEvent extends SignUpEvent {}

class RegisterWithGoogleEvent extends SignUpEvent {}

class RegisterWithAppleEvent extends SignUpEvent {}

class SignInScreenEvent extends SignUpEvent {}

class CheckAgreeEvent extends SignUpEvent {}
