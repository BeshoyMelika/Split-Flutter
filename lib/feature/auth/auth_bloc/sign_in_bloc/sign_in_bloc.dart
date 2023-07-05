
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<LoginEvent>(_loginEvent);
    on<GoToSignUpEvent>(_goToSignUpEvent);
  }

  FutureOr<void> _loginEvent(LoginEvent event, Emitter<SignInState> emit) {
    emit(SignInLoading());
    try {
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFail());
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _goToSignUpEvent(
      GoToSignUpEvent event, Emitter<SignInState> emit) {
    emit(ViewSignUpScreen());
  }
}
