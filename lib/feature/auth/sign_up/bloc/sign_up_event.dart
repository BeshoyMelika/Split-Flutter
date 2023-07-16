part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class RegisterEvent extends SignUpEvent {
  final String email, password, name, phone;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });
}

class RegisterWithGoogleEvent extends SignUpEvent {}

class RegisterWithAppleEvent extends SignUpEvent {}

class SignInScreenEvent extends SignUpEvent {}

class ChangeCheckIconEvent extends SignUpEvent {
  /*final bool isAgree;

  ChangeCheckIconEvent({required this.isAgree});*/
}

class ValidateRegisterFormEvent extends SignUpEvent {
  final GlobalKey<FormState> formKey;

  ValidateRegisterFormEvent({required this.formKey});
}
