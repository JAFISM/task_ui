import 'package:flutter/foundation.dart';

import '../../../model/payout_model.dart';

class AddItemProvider extends ChangeNotifier {
  final List<PaymentModel> _payouts = [];
  List<PaymentModel> get payouts => _payouts;
  final PaymentModel _payment = PaymentModel(amount: '', orderId: '', isPaymentDone: false);
  PaymentModel get payment => _payment;

  void setAmount(String value) {
    _payment.amount = value;
    notifyListeners();
  }

  void setOrderId(String value) {
    _payment.orderId = value;
    notifyListeners();
  }

  void setIsPaymentDone(bool value) {
    _payment.isPaymentDone = value;
    print("set method ${value}");
    notifyListeners();
  }

  void addPayout(PaymentModel payout) {
    _payouts.add(payout);
    notifyListeners();
  }
}
