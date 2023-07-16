part of 'otp_verification_bloc.dart';

abstract class OtpVerificationEvent {}

class OtpVerifyEvent extends OtpVerificationEvent {
  final String pinCode;

  OtpVerifyEvent({required this.pinCode});
}

class OtpRequestAgainEvent extends OtpVerificationEvent {}

class ValidateOtpVerificationFormEvent extends OtpVerificationEvent {
  final GlobalKey<FormState> formKey;

  ValidateOtpVerificationFormEvent({required this.formKey});
}
