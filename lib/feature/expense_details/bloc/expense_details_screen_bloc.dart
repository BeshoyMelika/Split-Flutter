import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:split/feature/expense_details/models/expense_details_ui_model.dart';
import 'package:split/feature/expense_details/models/payment_details_ui_model.dart';
import 'package:split/res/app_icons.dart';
part 'expense_details_screen_event.dart';
part 'expense_details_screen_state.dart';

class ExpenseDetailsScreenBloc
    extends Bloc<ExpenseDetailsScreenEvent, ExpenseDetailsScreenState> {
  static const networkImageHold =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4CtaDk3U49ukzwQTk5h6n1mwtWT9HULw-piOF2eF4&s";

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
    List<PaymentDetailsUIModel> paymentDetailsList = [
      PaymentDetailsUIModel(
          imageURL: networkImageHold,
          name: "Samuel Adel",
          amountOfMoney: 220,
          paymentStatus: paidStatus[PaymentStatus.paid.name] ?? false),
      PaymentDetailsUIModel(
          imageURL: networkImageHold,
          name: "Mina Adly",
          amountOfMoney: 220,
          paymentStatus: paidStatus[PaymentStatus.paid.name] ?? false),
      PaymentDetailsUIModel(
          imageURL: networkImageHold,
          name: "Mina Samir",
          amountOfMoney: 220,
          paymentStatus: paidStatus[PaymentStatus.paid.name] ?? false),
      PaymentDetailsUIModel(
          imageURL: networkImageHold,
          name: "Amgad Nady",
          amountOfMoney: 220,
          paymentStatus: paidStatus[PaymentStatus.notYet.name] ?? false),
    ];
    ExpenseDetailsUIModel expenseDetails = ExpenseDetailsUIModel(
        expenseTitle: "Food",
        expenseIcon: AppIcons.food,
        amountSpent: 520,
        lastUpdate: DateTime.now(),
        dueDateForPay: DateTime.now(),
        amountReceivable: 220,
        paidBy: "Besho",
        paidByImageURL: networkImageHold,
        splitUpon: paymentDetailsList);
    emit(LoadedExpenseDetailsSuccessfullyState(expenseDetails: expenseDetails));
  }

  FutureOr<void> _sendReminderToAllUsersExpenseDetailsEvent(
      SendReminderToAllUsersExpenseDetailsEvent event,
      Emitter<ExpenseDetailsScreenState> emit) async {
    emit(WaitingExpenseDetailsScreenState());
    await Future.delayed(const Duration(seconds: 1));
    emit(ReminderSentSuccessfullyExpenseDetailsState());
  }

  FutureOr<void> _addPhotoOrReceiptForExpenseDetailsEvent(
      AddPhotoOrReceiptForExpenseDetailsEvent event,
      Emitter<ExpenseDetailsScreenState> emit) async {
    emit(WaitingExpenseDetailsScreenState());
    await Future.delayed(const Duration(seconds: 1));
    emit(ReceiptORPhotoAddedSuccessfullyExpenseDetailsState());
  }
}

const paidStatus = {"paid": true, "notYet": false};

enum PaymentStatus { paid, notYet }
