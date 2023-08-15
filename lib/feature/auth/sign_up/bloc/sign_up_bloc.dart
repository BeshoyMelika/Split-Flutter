import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<RegisterEvent>(_registerEvent);
    on<RegisterWithGoogleEvent>(_registerWithGoogleEvent);
    on<RegisterWithAppleEvent>(_registerWithAppleEvent);
    on<SignInScreenEvent>(_signInScreenEvent);
    on<ChangeCheckIconEvent>(_changeCheckIconEvent);
    on<ValidateRegisterFormEvent>(_validateRegisterFormEvent);
  }

  FutureOr<void> _registerEvent(
      RegisterEvent event, Emitter<SignUpState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(SignUpSuccessState());
    } catch (e) {
      emit(ErrorState(errMessage: e.toString()));
    }
  }

  FutureOr<void> _registerWithGoogleEvent(
      RegisterWithGoogleEvent event, Emitter<SignUpState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(SignUpWithGoogleSuccessState());
    } catch (e) {
      emit(SocialFailureState(errMessage: e.toString()));
    }
  }

  FutureOr<void> _registerWithAppleEvent(
      RegisterWithAppleEvent event, Emitter<SignUpState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(SignUpWithAppleSuccessState());
    } catch (e) {
      emit(SocialFailureState(errMessage: e.toString()));
    }
  }

  FutureOr<void> _signInScreenEvent(
      SignInScreenEvent event, Emitter<SignUpState> emit) {
    emit(OpenSignInScreenState());
  }

  FutureOr<void> _validateRegisterFormEvent(
      ValidateRegisterFormEvent event, Emitter<SignUpState> emit) {
    if (event.formKey.currentState!.validate()) {
      event.formKey.currentState!.save();
      emit(ValidateRegisterState());
    } else {
      emit(NotValidateRegisterState());
    }
  }

  bool isAgree = false;
  FutureOr<void> _changeCheckIconEvent(
      ChangeCheckIconEvent event, Emitter<SignUpState> emit) {
    isAgree = switchBetweenAgreeAndDisAgree(isAgree);
    if (isAgree) {
      emit(CheckAgreeState());
    } else {
      emit(NotCheckAgreeState());
    }
  }
}

bool switchBetweenAgreeAndDisAgree(bool isAgree) {
  isAgree = !isAgree;
  return isAgree;
}
