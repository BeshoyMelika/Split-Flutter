import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'set_account_event.dart';
part 'set_account_state.dart';

class SetAccountBloc extends Bloc<SetAccountEvent, SetAccountState> {
  SetAccountBloc() : super(SetAccountInitial()) {
    on<SubmitSetAccountEvent>(_submitSetAccountEvent);
  }

  FutureOr<void> _submitSetAccountEvent(
      SubmitSetAccountEvent event, Emitter<SetAccountState> emit) {
    emit(SubmitSetAccountLoading());
    try {
      emit(SubmitSetAccountSuccess());
    } catch (e) {
      emit(SubmitSetAccountFailure());
    }
  }
}
