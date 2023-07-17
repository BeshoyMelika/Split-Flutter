import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'set_account_event.dart';
part 'set_account_state.dart';

class SetAccountBloc extends Bloc<SetAccountEvent, SetAccountState> {
  SetAccountBloc() : super(SetAccountInitial()) {
    on<SubmitSetAccountEvent>(_submitSetAccountEvent);
    on<ValidateSetAccountFormEvent>(_validateSetAccountFormEvent);
  }
  FutureOr<void> _submitSetAccountEvent(
      SubmitSetAccountEvent event, Emitter<SetAccountState> emit) {
    emit(SubmitSetAccountLoadingState());
    try {
      emit(SubmitSetAccountSuccessState());
      debugPrint(event.username);
    } catch (e) {
      emit(SubmitSetAccountFailureState());
    }
  }

  FutureOr<void> _validateSetAccountFormEvent(
      ValidateSetAccountFormEvent event, Emitter<SetAccountState> emit) {
    if (event.formKey.currentState!.validate()) {
      event.formKey.currentState!.save();
      emit(ValidateSetAccountState());
    } else {
      emit(NotValidateSetAccountState());
    }
  }
}
