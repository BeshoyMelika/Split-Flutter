part of 'otp_verification_bloc.dart';

abstract class OtpVerificationState extends Equatable {}

class OtpVerificationInitial extends OtpVerificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OtpVerifySuccessState extends OtpVerificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OtpVerifyLoadingState extends OtpVerificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OtpVerifyFailureState extends OtpVerificationState {
  final String errMessage;

  OtpVerifyFailureState({required this.errMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errMessage];
}

class ValidateOtpVerificationState extends OtpVerificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotValidateOtpVerificationState extends OtpVerificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
