import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  OtpVerificationBloc() : super(OtpVerificationInitial()) {
    on<OtpVerifyEvent>(_otpVerifyEvent);
    on<OtpRequestAgainEvent>(_otpRequestAgainEvent);
  }

  FutureOr<void> _otpVerifyEvent(OtpVerifyEvent event, Emitter<OtpVerificationState> emit) {
    emit(OtpVerifyLoadingState());
    try {
      emit(OtpVerifySuccessState());
    } catch (e) {
      emit(OtpVerifyFailureState());
    }
  }

  FutureOr<void> _otpRequestAgainEvent(
      OtpRequestAgainEvent event, Emitter<OtpVerificationState> emit) {}


}
