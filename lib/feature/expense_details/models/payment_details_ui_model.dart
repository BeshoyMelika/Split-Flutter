class PaymentDetailsUIModel {
  final String imageURL;
  final String name;
  final double amountOfMoney;
  final bool paymentStatus;

  PaymentDetailsUIModel(
      {required this.imageURL,
      required this.name,
      required this.amountOfMoney,
      required this.paymentStatus});
}
