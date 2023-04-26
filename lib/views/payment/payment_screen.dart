import 'package:flutter/material.dart';
import 'components/body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: const Body()
      ),
    );
  }

  AppBar buildAppBar() {
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
}
