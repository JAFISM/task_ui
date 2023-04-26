import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier{
  double _sum = 0.0;

  double get sum => _sum;

  void add(double value) {
    if(_sum + value <= 50000 && value <= 50000) {
      _sum += value;
      notifyListeners();
      print(sum);
    }else{
      return ;
    }
  }
  void reset() {
    _sum = 0.0;
    notifyListeners();
  }

}