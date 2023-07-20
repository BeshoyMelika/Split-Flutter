import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:split/_demo_data/demo_data.dart';
import 'package:split/feature/expense_details/models/expense_details_ui_model.dart';
part 'expense_details_screen_event.dart';
part 'expense_details_screen_state.dart';

class ExpenseDetailsScreenBloc
    extends Bloc<ExpenseDetailsScreenEvent, ExpenseDetailsScreenState> {
  ExpenseDetailsScreenBloc() : super(ExpenseDetailsScreenInitial()) {
    on<GetExpenseDetailsAPIEvent>(_getExpenseDetailsAPIEvent);
    on<SendReminderAPIEvent>(_sendReminderToAllUsersExpenseDetailsEvent);
    on<UploadPhotoAPIEvent>(_addPhotoOrReceiptForExpenseDetailsEvent);
    on<AppBarSwitcherEvent>(_appBarSwitcherEvent);
  }

  FutureOr<void> _getExpenseDetailsAPIEvent(GetExpenseDetailsAPIEvent event,
      Emitter<ExpenseDetailsScreenState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(LoadedExpenseDetailsSuccessfullyState(
        expenseDetails: DemoData.expenseDetails));
  }

  FutureOr<void> _sendReminderToAllUsersExpenseDetailsEvent(
      SendReminderAPIEvent event,
      Emitter<ExpenseDetailsScreenState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(ReminderSentSuccessfullyState());
  }

  FutureOr<void> _addPhotoOrReceiptForExpenseDetailsEvent(
      UploadPhotoAPIEvent event,
      Emitter<ExpenseDetailsScreenState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(PhotoUploadedSuccessfullyState());
  }

  FutureOr<void> _appBarSwitcherEvent(
      AppBarSwitcherEvent event, Emitter<ExpenseDetailsScreenState> emit) {
    if (event.isShrink != event.lastStatus) {
      emit(AppBarSwitcherState(lastState: event.isShrink));
    }
  }
}
