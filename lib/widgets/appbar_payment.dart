import 'package:flutter/material.dart';
class AppBarPayment extends StatelessWidget {
  const AppBarPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return appBarPayment();
  }
}
AppBar appBarPayment() {
  return AppBar(
    centerTitle: true,
    title: const Text("Payments",
      style: TextStyle(fontFamily: "Poppins"),
    ),
    leading: IconButton(icon:const Icon(Icons.arrow_back),onPressed: (){},),
    actions: [
      IconButton(onPressed: (){}, icon: const Icon(Icons.info_outline))
    ],
  );
}
