import 'dart:async';

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
    on<LoadExpenseDetailsEvent>(_loadExpenseDetailsEvent);
    on<SendReminderToAllUsersExpenseDetailsEvent>(
        _sendReminderToAllUsersExpenseDetailsEvent);
    on<AddPhotoOrReceiptForExpenseDetailsEvent>(
        _addPhotoOrReceiptForExpenseDetailsEvent);
  }

  FutureOr<void> _loadExpenseDetailsEvent(LoadExpenseDetailsEvent event,
      Emitter<ExpenseDetailsScreenState> emit) async {
    emit(WaitingExpenseDetailsScreenState());
    await Future.delayed(const Duration(seconds: 1));
    emit(LoadedExpenseDetailsSuccessfullyState(
        expenseDetails: DemoData.expenseDetails));
  }

  FutureOr<void> _sendReminderToAllUsersExpenseDetailsEvent(
      SendReminderToAllUsersExpenseDetailsEvent event,
      Emitter<ExpenseDetailsScreenState> emit) {}

  FutureOr<void> _addPhotoOrReceiptForExpenseDetailsEvent(
      AddPhotoOrReceiptForExpenseDetailsEvent event,
      Emitter<ExpenseDetailsScreenState> emit) {}
}
