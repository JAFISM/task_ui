import 'package:flutter/material.dart';
import '../widgets/appbar_payment.dart';
import 'components/body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarPayment(),
        body: const Body()
      ),
    );
  }
}
