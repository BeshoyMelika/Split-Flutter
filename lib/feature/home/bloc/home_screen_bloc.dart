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
    if (event.formKey.currentState!.validate()) {
      event.formKey.currentState!.save();
      emit(ValidationDoneSuccessfullyHomeScreenState());
    } else {
      emit(NotValidHomeScreenState());
    }
  }

  FutureOr<void> _createNewGroupEvent(
      CreateNewGroupEvent event, Emitter<HomeScreenState> emit) async {
    emit(LoadingHomeScreenState());
    await Future.delayed(const Duration(seconds: 3));
    debugPrint(event.newGroup.groupName);
    debugPrint(event.newGroup.discription);
    debugPrint(event.newGroup.type);
    debugPrint(event.newGroup.typeOfSplit);
    debugPrint(event.newGroup.image);
    debugPrint(event.newGroup.currency);
    emit(NewGroupCreatedSuccessfullyState());
  }
}
