import 'package:flutter/material.dart';

import '../../constants.dart';

class AmountCard extends StatelessWidget {
  const AmountCard({
    Key? key,
    this.text,
    this.amount,
    this.color=kBackgroundColor,
  }) : super(key: key);
  final String? text;
  final String? amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/12,
      width: MediaQuery.of(context).size.width*0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$text',style: const TextStyle(color: kBackgroundColor,fontSize: 12),),
            Text("$amount",style: const TextStyle(color: Colors.white,fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
