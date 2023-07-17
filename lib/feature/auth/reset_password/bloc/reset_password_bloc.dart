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
      SubmitPasswordEvent event, Emitter<ResetPasswordState> emit) {
    emit(SubmitPasswordLoadingState());
    try {
      emit(SubmitPasswordSuccessState());
      debugPrint(event.newPassword);
      debugPrint(event.confirmNewPassword);
    } catch (e) {
      emit(SubmitPasswordFailureState());
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
