import 'package:flutter/material.dart';
import 'package:task_ui/views/payment/components/paymentMethod.dart';
import '../../model/payout_model.dart';
import '../../widgets/appbar_payment.dart';
import 'components/add_item.dart';
import 'components/body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("page build");
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarPayment(),
        body:  Body(),
        floatingActionButton: FloatingActionButton(
          backgroundColor:  Theme.of(context).primaryColor,
          mini: true,
          onPressed: (){
            addItem(context);
          },
          child: Icon(Icons.add,),
        ),
      ),
    );
  }
}
