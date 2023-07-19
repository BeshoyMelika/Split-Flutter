import 'package:flutter/material.dart';
import 'package:split/feature/expense_details/models/payment_details_ui_model.dart';

class ExpenseDetailsUIModel {
  final String expenseTitle;
  final IconData expenseIcon;
  final double amountSpent;
  final double amountReceivable;
  final String paidBy;
  final String paidByImageURL;
  final List<PaymentDetailsUIModel> splitUpon;
  final DateTime lastUpdate;
  final DateTime dueDateForPay;

  ExpenseDetailsUIModel({
    required this.expenseTitle,
    required this.expenseIcon,
    required this.lastUpdate,
    required this.amountSpent,
    required this.amountReceivable,
    required this.paidBy,
    required this.paidByImageURL,
    required this.splitUpon,
    required this.dueDateForPay,
  });
}
