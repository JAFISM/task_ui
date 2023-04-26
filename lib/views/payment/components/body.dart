import 'package:flutter/material.dart';
import 'package:task_ui/constants.dart';
import 'package:task_ui/views/payment/components/paymentMethod.dart';
import 'package:task_ui/views/payment/components/payment_overview.dart';
import 'package:task_ui/views/payment/components/transaction_limit.dart';

import '../../widgets/payout_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Tab 1'),
    Tab(text: 'Tab 2'),
    Tab(text: 'Tab 3'),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          children: [
            transactionLimit(context),
            paymentMethod(context),
            paymentOverview(context),
            buildDefaultTabController(context),
            tabBarViews()
          ],
        ),
      ),
    );
  }

  Expanded tabBarViews() {
    return Expanded(child: TabBarView(
               controller: _tabController,
            children: [
              Container(
                color: Colors.red,
                child: Center(
                  child: Text('Tab 1 content'),
                ),
              ),
              Container(
                //color: Colors.green,
                child: ListView.builder(
                  itemCount: 10,
                    itemBuilder: (_,index)=>
                    PayoutCard(),
                )
              ),
              Container(
                color: Colors.yellowAccent,
                child: Center(
                  child: Text('Tab 3 content'),
                ),
              ),
            ],
          ));
  }

  DefaultTabController buildDefaultTabController(BuildContext context) {
    return DefaultTabController(
            length: myTabs.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Transactions",style: headingStyle,),
               TabBar(
                 indicator: ShapeDecoration(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(25),
                   ),
                 ),
                   controller: _tabController,
                   tabs: [
                     Tab(
                       child: Container(
                         height: MediaQuery.of(context).size.height/25,
                         decoration: BoxDecoration(
                           color:kBoarderColor,
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child: Align(
                           alignment: Alignment.center,
                           child: Text('On hold'),
                         ),
                       ),
                     ),
                     Tab(
                       child: Container(
                         height: MediaQuery.of(context).size.height/25,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color: kPrimaryColor,
                         ),
                         child: Align(
                           alignment: Alignment.center,
                           child: Text('Payouts'),
                         ),
                       ),
                     ),
                     Tab(
                       child: Container(
                         height: MediaQuery.of(context).size.height/25,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color: kBoarderColor,
                         ),
                         child: Align(
                           alignment: Alignment.center,
                           child: Text('Refunds'),
                         ),
                       ),
                     ),
                   ]
               )
              ],
            ),
          );
  }
  //
  // Container paymentOverview(BuildContext context) {
  //   return Container(
  //     // color: Colors.red,
  //     margin: const EdgeInsets.symmetric(),
  //     height: MediaQuery.of(context).size.height / 7,
  //     width: double.infinity,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Row(
  //           children: const [
  //             Text(
  //               "Payment Overview",
  //               style: headingStyle,
  //             ),
  //             Spacer(),
  //             Text("Life time"),
  //             Icon(
  //               Icons.arrow_drop_down_rounded,
  //               size: 30,
  //               color: kSubTextColor,
  //             )
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: const [
  //             AmountCard(
  //               text: "AMOUNT ON HOLD",
  //               amount: "₹0",
  //               color: kSecondaryColor2,
  //             ),
  //             AmountCard(
  //               text: "AMOUNT RECEIVED",
  //               amount: "₹13,332",
  //               color: kSecondaryColor1,
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // Container paymentMethod(BuildContext context) {
  //   return Container(
  //     height: MediaQuery.of(context).size.height / 9,
  //     width: double.infinity,
  //     margin: const EdgeInsets.symmetric(),
  //     decoration: const BoxDecoration(
  //         border: Border(bottom: BorderSide(width: 1.5, color: kBoarderColor))),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.symmetric(),
  //           child: Row(
  //             children: const [
  //               Text(
  //                 "Default Method",
  //                 style: headingStyle,
  //               ),
  //               Spacer(),
  //               Text("Online Payments"),
  //               Icon(
  //                 Icons.arrow_forward_ios,
  //                 size: 16,
  //                 color: kSubTextColor,
  //               )
  //             ],
  //           ),
  //         ),
  //         Container(
  //           margin: const EdgeInsets.symmetric(),
  //           child: Row(
  //             children: const [
  //               Text(
  //                 "Payment Profile",
  //                 style: headingStyle,
  //               ),
  //               Spacer(),
  //               Text("Bank Account"),
  //               Icon(
  //                 Icons.arrow_forward_ios,
  //                 size: 16,
  //                 color: kSubTextColor,
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Container transactionLimit(BuildContext context) {
  //   return Container(
  //     height: MediaQuery.of(context).size.height / 5,
  //     width: double.infinity,
  //     margin: const EdgeInsets.symmetric(),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(5),
  //         border: Border.all(color: kBoarderColor)),
  //     child: Container(
  //       margin: const EdgeInsets.only(left: 10, right: 10),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           const Text(
  //             "Transaction Limit",
  //             style: headingStyle,
  //           ),
  //           const Text(
  //             "A free limit up to which you will receive\nthe online payments directly in your bank",
  //             style: subheadingStyle,
  //           ),
  //           FAProgressBar(
  //             backgroundColor: kBoarderColor,
  //             size: 8,
  //             currentValue: 30,
  //             progressColor: Colors.blue,
  //           ),
  //           const Text(
  //             "36,668 left out of ₹50,0000",
  //             style: subheadingStyle,
  //           ),
  //           ElevatedButton(
  //             onPressed: () {},
  //             child: const Text("Increase limit",
  //                 style: TextStyle(fontFamily: "Poppins")),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
