import 'package:flutter/material.dart';
import 'package:task_ui/widgets/payout_card.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
Container productCard(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 12,
    width: MediaQuery.of(context).size.width/8,
    decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8)),
    child: Image.network(
      '${PayoutCard}',
      fit: BoxFit.contain,
    ),
  );
}