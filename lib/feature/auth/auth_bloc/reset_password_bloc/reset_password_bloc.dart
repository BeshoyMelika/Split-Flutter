import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<SubmitPasswordEvent>(_submitPasswordEvent);
  }

  FutureOr<void> _submitPasswordEvent(
      SubmitPasswordEvent event, Emitter<ResetPasswordState> emit) {
    emit(SubmitPasswordLoadingState());
    try {
      emit(SubmitPasswordSuccessState());
    } catch (e) {
      emit(SubmitPasswordFailureState());
    }
  }
}
