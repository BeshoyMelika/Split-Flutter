import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
    on<ValidateLoginFormEvent>(_validateLoginFormEvent);
  }

  FutureOr<void> _loginEvent(
      LoginEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(SignInSuccessState());
      debugPrint(event.email);
      debugPrint(event.password);
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }

  FutureOr<void> _loginWithGoogleEvent(
      LoginWithGoogleEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }

  FutureOr<void> _loginWithAppleEvent(
      LoginWithAppleEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }

  FutureOr<void> _forgetPasswordEvent(
      ForgetPasswordEvent event, Emitter<SignInState> emit) {
    emit(OpenForgetPasswordScreenState());
  }

  FutureOr<void> _signUpEvent(
      SignUpScreenEvent event, Emitter<SignInState> emit) {
    emit(OpenSignUpScreenState());
  }

  FutureOr<void> _validateLoginFormEvent(
      ValidateLoginFormEvent event, Emitter<SignInState> emit) {
    if (event.formKey.currentState!.validate()) {
      event.formKey.currentState!.save();
      emit(ValidateLoginState());
    } else {
      emit(NotValidateLoginState());
    }
  }
}
