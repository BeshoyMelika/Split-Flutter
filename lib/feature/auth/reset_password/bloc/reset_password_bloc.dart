import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<SubmitPasswordEvent>(_submitPasswordEvent);
    on<ValidateResetPasswordFormEvent>(_validateResetPasswordFormEvent);
  }
  FutureOr<void> _submitPasswordEvent(
      SubmitPasswordEvent event, Emitter<ResetPasswordState> emit) async {
    emit(SubmitPasswordLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(SubmitPasswordSuccessState());
      debugPrint(event.newPassword);
      debugPrint(event.confirmNewPassword);
    } catch (e) {
      emit(SubmitPasswordFailureState(errMessage: e.toString()));
    }
  }

  FutureOr<void> _validateResetPasswordFormEvent(
      ValidateResetPasswordFormEvent event, Emitter<ResetPasswordState> emit) {
    if (event.formKey.currentState!.validate()) {
      event.formKey.currentState!.save();
      emit(ValidateResetPasswordFormState());
    } else {
      emit(NotValidateResetPasswordFormState());
    }
  }
}
