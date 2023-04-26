import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PayoutCard extends StatelessWidget {
  //late payout=PayoutModel();
  PayoutCard(
      {Key? key,
      required this.amount,
      required this.image,
      required this.orderId,
      required this.paymentDone})
      : super(key: key);

  String? image;
  String? amount;
  String? orderId;
  bool? paymentDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: kBackgroundColor,
          border: Border(bottom: BorderSide(width: 1.5, color: kBoarderColor))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                productCard(context),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #$orderId",
                      style: headingStyle,
                    ),
                    Text(
                      "jul 12 02:06 PM",
                      style: subheadingStyle,
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹$amount",
                      style: TextStyle(color:paymentDone==false?Colors.red.shade300:kPrimaryColor),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color:paymentDone==false? Colors.red.shade300:kSecondaryColor1,
                          size: 8,
                        ),
                        Container(
                          child: Text(paymentDone==false?"failed":"Success",
                            style: TextStyle(color:paymentDone==false?Colors.red.shade300:kSecondaryColor1 ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Text("₹799  deposited to:588696398655585899")
        ],
      ),
    );
  }

  Container productCard(BuildContext context) {
    return Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width/8,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8)),
                child: Image.network(
                  '$image',
                  fit: BoxFit.contain,
                ),
              );
  }
}
