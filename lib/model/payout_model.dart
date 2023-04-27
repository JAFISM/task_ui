class PayoutModel {
  PayoutModel(
      {required this.amount,
      required this.image,
      required this.orderId,
      this.paymentDone = false});

  String? amount;
  String? image;
  String? orderId;
  bool? paymentDone;

  factory PayoutModel.fromJson(Map<String, dynamic> json) {
    return PayoutModel(
      image: json['image'],
      amount: json['amount'],
      orderId: json['orderId'],
      paymentDone: json['paymentDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'amount': amount,
      'orderId': orderId,
      'paymentDone': paymentDone,
    };
  }
}
