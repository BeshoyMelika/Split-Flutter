part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInFailureState extends SignInState {}

class SignInLoadingState extends SignInState {}

class ForgetPasswordState extends SignInState {}

class SignUpScreenState extends SignInState {}
