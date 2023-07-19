import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:split/feature/create_group/models/group_send_ui_model.dart';
part 'create_group_screen_event.dart';
part 'create_group_screen_state.dart';

class CreateGroupScreenBloc
    extends Bloc<CreateGroupScreenEvent, CreateGroupScreenState> {
  CreateGroupScreenBloc() : super(CreateGroupScreenInitial()) {
    on<ValidateFormFieldsEvent>(_validateFormFieldsEvent);
    on<CreateNewGroupEvent>(_createNewGroupEvent);
  }

  FutureOr<void> _validateFormFieldsEvent(
      ValidateFormFieldsEvent event, Emitter<CreateGroupScreenState> emit) {
    if (event.formKey.currentState!.validate()) {
      event.formKey.currentState!.save();
      emit(ValidationDoneSuccessfullyCreateGroupScreenState());
    } else {
      emit(NotValidCreateGroupScreenState());
    }
  }

  FutureOr<void> _createNewGroupEvent(
      CreateNewGroupEvent event, Emitter<CreateGroupScreenState> emit) async {
    emit(LoadingCreateGroupScreenState());
    await Future.delayed(const Duration(seconds: 3));
    debugPrint("${event.newGroup}");

    emit(NewGroupCreatedSuccessfullyState());
  }
}
