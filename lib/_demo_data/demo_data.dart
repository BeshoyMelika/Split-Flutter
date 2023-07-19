import 'package:split/feature/expense_details/models/expense_details_ui_model.dart';
import 'package:split/feature/expense_details/models/payment_details_ui_model.dart';
import 'package:split/res/app_icons.dart';

class DemoData {
  static const networkImageHold =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4CtaDk3U49ukzwQTk5h6n1mwtWT9HULw-piOF2eF4&s";

  static List<PaymentDetailsUIModel> paymentDetailsList = [
    PaymentDetailsUIModel(
      imageURL: DemoData.networkImageHold,
      name: "Samuel Adel",
      amountOfMoney: 220,
      paymentStatus: false,
    ),
    PaymentDetailsUIModel(
      imageURL: DemoData.networkImageHold,
      name: "Mina Adly",
      paymentStatus: true,
      amountOfMoney: 200,
    ),
    PaymentDetailsUIModel(
      imageURL: DemoData.networkImageHold,
      name: "Amgad Nady",
      amountOfMoney: 220,
      paymentStatus: false,
    ),
  ];
  static ExpenseDetailsUIModel expenseDetails = ExpenseDetailsUIModel(
      expenseTitle: "Food",
      expenseIcon: AppIcons.food,
      amountSpent: 520,
      lastUpdate: DateTime.now(),
      dueDateForPay: DateTime.now(),
      amountReceivable: 220,
      paidBy: "Besho",
      paidByImageURL: DemoData.networkImageHold,
      splitUpon: paymentDetailsList);
}
