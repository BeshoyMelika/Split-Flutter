import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'success_message_event.dart';
part 'success_message_state.dart';

class SuccessMessageBloc
    extends Bloc<SuccessMessageEvent, SuccessMessageState> {
  SuccessMessageBloc() : super(SuccessMessageInitial()) {
    on<DoneEvent>(_doneEvent);
  }
  FutureOr<void> _doneEvent(
      DoneEvent event, Emitter<SuccessMessageState> emit) async {
    emit(OpenLoginScreenLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(OpenLoginScreenSuccessState());
    } catch (e) {
      emit(OpenLoginScreenFailureState(errMessage: e.toString()));
    }
  }
}
