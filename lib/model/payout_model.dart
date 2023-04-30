class PaymentModel {
  String amount;
  String orderId;
  bool isPaymentDone;

  PaymentModel({
    required this.amount,
    required this.orderId,
    required this.isPaymentDone,
  });
}