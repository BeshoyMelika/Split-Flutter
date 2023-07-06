part of 'otp_verification_bloc.dart';

abstract class OtpVerificationEvent {}

class OtpVerifyEvent extends OtpVerificationEvent {}

class OtpRequestAgainEvent extends OtpVerificationEvent {}
