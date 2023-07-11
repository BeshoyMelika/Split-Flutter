import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:split/models/group_model.dart';
part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<ValidateFormFieldsEvent>(_validateFormFieldsEvent);
    on<CreateNewGroupEvent>(_createNewGroupEvent);
  }

  FutureOr<void> _validateFormFieldsEvent(
      ValidateFormFieldsEvent event, Emitter<HomeScreenState> emit) {
    if (event.globalKey.currentState!.validate()) {
      emit(ValidationDoneSuccessfullyHomeScreenState());
    } else {
      emit(UnValidHomeScreenState());
    }
  }

  FutureOr<void> _createNewGroupEvent(
      CreateNewGroupEvent event, Emitter<HomeScreenState> emit) async {
    emit(WaitingHomeScreenState());
    await Future.delayed(const Duration(seconds: 2));
    emit(NewGroupCreatedSuccessfullyState());
  }
}
