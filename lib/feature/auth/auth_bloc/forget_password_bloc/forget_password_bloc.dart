import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ResetPasswordEvent>(_resetPasswordEvent);
  }

  FutureOr<void> _resetPasswordEvent(
      ResetPasswordEvent event, Emitter<ForgetPasswordState> emit) {
    emit(ResetPasswordLoadingState());
    try {
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState());
    }
  }
}
