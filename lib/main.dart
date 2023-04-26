import 'package:flutter/material.dart';
import 'package:task_ui/theme.dart';
import 'package:task_ui/views/payment/payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: const PaymentScreen(),
    );
  }
}
