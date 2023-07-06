part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpFailureState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignInScreenState extends SignUpState {}

class CheckAgreeState extends SignUpState {}
