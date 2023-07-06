part of 'otp_verification_bloc.dart';

abstract class OtpVerificationState {}

class OtpVerificationInitial extends OtpVerificationState {}

class OtpVerifySuccessState extends OtpVerificationState {}

class OtpVerifyLoadingState extends OtpVerificationState {}

class OtpVerifyFailureState extends OtpVerificationState {}
