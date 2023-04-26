import 'package:flutter/material.dart';

import '../../../constants.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return paymentMethod(context);
  }
}
Container paymentMethod(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 9,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(),
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.5, color: kBoarderColor))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(),
          child: Row(
            children: const [
              Text(
                "Default Method",
                style: headingStyle,
              ),
              Spacer(),
              Text("Online Payments"),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: kSubTextColor,
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(),
          child: Row(
            children: const [
              Text(
                "Payment Profile",
                style: headingStyle,
              ),
              Spacer(),
              Text("Bank Account"),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: kSubTextColor,
              )
            ],
          ),
        ),
      ],
    ),
  );
}