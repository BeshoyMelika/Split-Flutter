part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpFailureState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignInScreenState extends SignUpState {}

class CheckAgreeState extends SignUpState {}

class NotCheckAgreeState extends SignUpState {}

class ValidateRegisterState extends SignUpState {}

class NotValidateRegisterState extends SignUpState {}
