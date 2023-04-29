import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier{
  // double _sum = 0.0;
  //
  // double get sum => _sum;

  double _limit = 50000.0;
  double get limit =>_limit;

  // void add(double value) {
  //   if(_sum + value <= 50000 && value <= 50000) {
  //     _sum += value;
  //     notifyListeners();
  //     print(sum);
  //   }else{
  //     // _sum += value; // add the value even if it exceeds the maximum limit
  //     // notifyListeners();
  //     return ;
  //   }
  // }
  // void reset() {
  //   _sum = 0.0;
  //   notifyListeners();
  // }
   void increaseLimit(double value){
    _limit+=value;
    notifyListeners();
   }

   void rest(){
    _limit=50000.0;
   }

}