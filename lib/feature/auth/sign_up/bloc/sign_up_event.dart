part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {}

class RegisterEvent extends SignUpEvent {
  final String email, password, name, phone;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  @override
  List<Object?> get props => [email, password, name, phone];
}

class RegisterWithGoogleEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}

class RegisterWithAppleEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}

class SignInScreenEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}

class ChangeCheckIconEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}

class ValidateRegisterFormEvent extends SignUpEvent {
  final GlobalKey<FormState> formKey;

  ValidateRegisterFormEvent({required this.formKey});

  @override
  List<Object?> get props => [formKey];
}
