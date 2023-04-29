import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ui/views/payment/components/popup_increase_limit.dart';
import 'package:task_ui/views/payment/components/progress_bar.dart';
import 'package:task_ui/views/payment/controller/payment_provider.dart';

import '../../../utils/constants.dart';

class TransactionLimit extends StatelessWidget {
  const TransactionLimit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactionLimit(context);
  }
}

Container transactionLimit(BuildContext context) {
  print("transaction build");
  return Container(
    height: MediaQuery.of(context).size.height / 4.6,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: kBoarderColor)),
    child: Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         // Theme(data: Theme.of(context).copyWith(textTheme:TextTheme(bodyLarge:TextStyle() )), child: Text("Transaction Limit")),
          const Text(
            "Transaction Limit",
            style: headingStyle
          ),
          const Text(
            "A free limit up to which you will receive\nthe online payments directly in your bank",
            style: subheadingStyle,
          ),
          Consumer<PaymentProvider>(
            builder: (context, value, child) {
              print("limit build");
              return FAProgressBar(
                backgroundColor: kBoarderColor,
                size: 8,
                currentValue: 36668,
                maxValue: Provider.of<PaymentProvider>(context, listen: false).limit,
                progressColor: Colors.blue,
              );
            },
          ),
          Consumer<PaymentProvider>(
            builder: (context, value, child) => Text(
              "36,668  left out of ₹${Provider.of<PaymentProvider>(context, listen: false).limit}",
              style: subheadingStyle,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              popUpDialog(context);
            },
            child: const Text("Increase limit",
                style: TextStyle(fontFamily: "Poppins")),
          ),
        ],
      ),
    ),
  );
}
