import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<LoginEvent>(_loginEvent);
    on<LoginWithGoogleEvent>(_loginWithGoogleEvent);
    on<LoginWithAppleEvent>(_loginWithAppleEvent);
    on<ForgetPasswordEvent>(_forgetPasswordEvent);
    on<SignUpScreenEvent>(_signUpEvent);
  }

  FutureOr<void> _loginEvent(LoginEvent event, Emitter<SignInState> emit) {
    emit(SignInLoadingState());
    try {
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInFailureState());
    }
  }

  FutureOr<void> _loginWithGoogleEvent(
      LoginWithGoogleEvent event, Emitter<SignInState> emit) {
    emit(SignInLoadingState());
    try {
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInFailureState());
    }
  }

  FutureOr<void> _loginWithAppleEvent(
      LoginWithAppleEvent event, Emitter<SignInState> emit) {
    emit(SignInLoadingState());
    try {
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInFailureState());
    }
  }

  FutureOr<void> _forgetPasswordEvent(
      ForgetPasswordEvent event, Emitter<SignInState> emit) {
    emit(ForgetPasswordState());
  }

  FutureOr<void> _signUpEvent(SignUpScreenEvent event, Emitter<SignInState> emit) {
    emit(SignUpScreenState());
  }
}
