import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

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
            children:  [
              Text(
                "Default Method",
                style: headingStyle,
              ),
              Spacer(),
              Text("Online Payments"),
              GestureDetector(
                onTap: (){},
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kSubTextColor,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(),
          child: Row(
            children:  [
              Text(
                "Payment Profile",
                style: headingStyle,
              ),
              Spacer(),
              Text("Bank Account"),
              GestureDetector(
                onTap: (){},
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kSubTextColor,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}