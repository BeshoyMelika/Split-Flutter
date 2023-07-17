import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ResetPasswordEvent>(_resetPasswordEvent);
    on<ValidateForgetPasswordFormEvent>(_validateForgetPasswordFormEvent);
  }
  FutureOr<void> _resetPasswordEvent(
      ResetPasswordEvent event, Emitter<ForgetPasswordState> emit) {
    emit(ResetPasswordLoadingState());
    try {
      emit(ResetPasswordSuccessState());
      debugPrint(event.email);
    } catch (e) {
      emit(ResetPasswordFailureState());
    }
  }

  FutureOr<void> _validateForgetPasswordFormEvent(
      ValidateForgetPasswordFormEvent event,
      Emitter<ForgetPasswordState> emit) {
    if (event.formKey.currentState!.validate()) {
      event.formKey.currentState!.save();
      emit(ValidateForgetPasswordFormState());
    } else {
      emit(NotValidateForgetPasswordFormState());
    }
  }
}
