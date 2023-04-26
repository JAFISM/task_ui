import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../widgets/amount_card.dart';

class PaymentOverview extends StatelessWidget {
  const PaymentOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String? _selectedValue;
    return paymentOverview(context);
  }
}

Container paymentOverview(BuildContext context) {
  return Container(
    // color: Colors.red,
    margin: const EdgeInsets.symmetric(),
    height: MediaQuery.of(context).size.height / 7,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const Text(
              "Payment Overview",
              style: headingStyle,
            ),
            Spacer(),
            Text("Life time"),
            GestureDetector(
              onTap: (){},
              child: Icon(
                Icons.arrow_drop_down_rounded,
                size: 30,
                color: kSubTextColor,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            AmountCard(
              text: "AMOUNT ON HOLD",
              amount: "₹0",
              color: kSecondaryColor2,
            ),
            AmountCard(
              text: "AMOUNT RECEIVED",
              amount: "₹13,332",
              color: kSecondaryColor1,
            )
          ],
        )
      ],
    ),
  );
}
