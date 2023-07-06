import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<RegisterEvent>(_registerEvent);
    on<RegisterWithGoogleEvent>(_registerWithGoogleEvent);
    on<RegisterWithAppleEvent>(_registerWithAppleEvent);
    on<SignInScreenEvent>(_signInScreenEvent);
    on<CheckAgreeEvent>(_checkAgreeEvent);
  }

  FutureOr<void> _registerEvent(
      RegisterEvent event, Emitter<SignUpState> emit) {
    emit(SignUpLoadingState());
    try {
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpFailureState());
    }
  }

  FutureOr<void> _registerWithGoogleEvent(
      RegisterWithGoogleEvent event, Emitter<SignUpState> emit) {
    emit(SignUpLoadingState());
    try {
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpFailureState());
    }
  }

  FutureOr<void> _registerWithAppleEvent(
      RegisterWithAppleEvent event, Emitter<SignUpState> emit) {
    emit(SignUpLoadingState());
    try {
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpFailureState());
    }
  }

  FutureOr<void> _signInScreenEvent(
      SignInScreenEvent event, Emitter<SignUpState> emit) {
    emit(SignInScreenState());
  }

  FutureOr<void> _checkAgreeEvent(
      CheckAgreeEvent event, Emitter<SignUpState> emit) {}
}
