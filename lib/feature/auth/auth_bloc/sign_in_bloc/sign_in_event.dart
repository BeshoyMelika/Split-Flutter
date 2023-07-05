part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class LoginEvent extends SignInEvent {}

class GoToSignUpEvent extends SignInEvent {}
