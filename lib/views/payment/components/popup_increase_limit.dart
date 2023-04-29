import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';
import '../controller/payment_provider.dart';
class LimitPopUp extends StatelessWidget {
  const LimitPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return popUpDialog(context);
  }
}
popUpDialog(BuildContext context) {
  final TextEditingController _controller = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kBackgroundColor,
        title: Text(
          "Enter Amount",
          style: headingStyle,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<PaymentProvider>(builder: (context, value, child) {
              return TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.attach_money_outlined,),
                    //label: Text("₹"),
                      labelStyle: TextStyle(fontSize: 28 ),
                      enabledBorder:
                      OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8)),
                    //errorText: value.sum > 50000 ? "Maximum limit exceeded" : null,
                  ),
                );
            },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text("Cancel"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final double newValue = double.tryParse(_controller.text) ?? 0.0;
                    Provider.of<PaymentProvider>(context, listen: false).increaseLimit(newValue);
                  },
                  child: Text("Ok"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}