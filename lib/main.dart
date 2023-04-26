import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ui/utils/theme.dart';
import 'package:task_ui/views/payment/controller/payment_provider.dart';
import 'package:task_ui/views/payment/payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PaymentProvider>(create: (_)=>PaymentProvider()),
      ],
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const PaymentScreen(),
      ),
    );
  }
}
