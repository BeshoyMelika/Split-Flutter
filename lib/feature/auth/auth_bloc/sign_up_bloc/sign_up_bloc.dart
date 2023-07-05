import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<RegisterEvent>(_registerEvent);
    on<GoToSignInEvent>(_goToSignInEvent);
  }

  FutureOr<void> _registerEvent(
      RegisterEvent event, Emitter<SignUpState> emit) {
    emit(SignUpLoading());
    try {
      emit(SignUpSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(SignUpFail());
    }
  }

  FutureOr<void> _goToSignInEvent(
      GoToSignInEvent event, Emitter<SignUpState> emit) {
    emit(ViewSignInScreen());
  }
}
