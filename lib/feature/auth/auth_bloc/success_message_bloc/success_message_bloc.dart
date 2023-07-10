import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'success_message_event.dart';
part 'success_message_state.dart';

class SuccessMessageBloc
    extends Bloc<SuccessMessageEvent, SuccessMessageState> {
  SuccessMessageBloc() : super(SuccessMessageInitial()) {
    on<DoneEvent>(_doneEvent);
  }

  FutureOr<void> _doneEvent(
      DoneEvent event, Emitter<SuccessMessageState> emit) {
    emit(DoneLoadingState());
    try {
      emit(DoneSuccessState());
    } catch (e) {
      emit(DoneFailureState());
    }
  }
}
