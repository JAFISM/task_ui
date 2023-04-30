//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/payout_model.dart';
import '../../../utils/constants.dart';
import '../controller/add_item_controller.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return addItem(context);
  }
}

addItem(BuildContext context) {
  TextEditingController _amountcontroller = TextEditingController();
  TextEditingController _orderIdcontroller = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kBackgroundColor,
        title: Text(
          "Add Item",
          style: headingStyle,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<AddItemProvider>(
              builder: (context, provider, _) => TextField(
                onChanged: (value) => provider.setOrderId(value),
                controller: _orderIdcontroller,
                keyboardType: TextInputType.number,
                maxLength: 6,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Order Id",
                  labelStyle: subheadingStyle,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8)),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Consumer<AddItemProvider>(
              builder: (context, provider, _) => TextField(
                controller: _amountcontroller,
                onChanged: (value) => provider.setAmount(value),
                keyboardType: TextInputType.number,
                maxLength: 6,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Amount",
                  labelStyle: subheadingStyle,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8)),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Consumer<AddItemProvider>(
                builder: (context, provider, _) => CheckboxListTile(
                      title: Text("Payment Done"),
                      value: provider.payment.isPaymentDone,
                      onChanged: (value) {
                        Provider.of<AddItemProvider>(context, listen: false)
                            .setIsPaymentDone(value!);
                        print('checkbox $value');
                       // provider.payment.isPaymentDone = value;
                      },
                    )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                ),
                Consumer<AddItemProvider>(
                  builder: (context, provider, child) {
                    return ElevatedButton(
                      onPressed: () {
                        Provider.of<AddItemProvider>(context, listen: false).addPayout(
                          PaymentModel(
                            amount: _amountcontroller.text,
                            orderId: _orderIdcontroller.text,
                            isPaymentDone: provider.payment.isPaymentDone,
                          ),
                        );
                      },
                      child: Text("Save"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
