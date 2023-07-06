import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'congrats_event.dart';
part 'congrats_state.dart';

class CongratsBloc extends Bloc<CongratsEvent, CongratsState> {
  CongratsBloc() : super(CongratsInitial()) {
    on<DoneEvent>(_doneEvent);
  }

  FutureOr<void> _doneEvent(DoneEvent event, Emitter<CongratsState> emit) {
    emit(DoneLoadingState());
    try {
      emit(DoneSuccessState());
    } catch (e) {
      emit(DoneFailureState());
    }
  }
}
