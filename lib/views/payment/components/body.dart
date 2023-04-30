import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ui/utils/constants.dart';
import 'package:task_ui/views/payment/components/paymentMethod.dart';
import 'package:task_ui/views/payment/components/payment_overview.dart';
import 'package:task_ui/views/payment/components/transaction_limit.dart';
import 'package:task_ui/views/payment/controller/add_item_controller.dart';

import '../../../widgets/payout_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'on hold'),
    Tab(text: 'payout'),
    Tab(text: 'refunds'),
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
    return Container(
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
    );
  }

  Expanded tabBarViews() {
    return Expanded(
        child: TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
          child: Center(
            child: Text('Tab 1 content'),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(),
            child: Consumer<AddItemProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: provider.payouts.length,
                  itemBuilder: (_, index) {
                    print(
                        " pay test${Provider.of<AddItemProvider>(context, listen: false).payment.isPaymentDone}");
                    return PayoutCard(
                      amount: provider.payouts[index].amount,
                      orderId: provider.payouts[index].orderId,
                      paymentDone: Provider.of<AddItemProvider>(context)
                          .payouts[index]
                          .isPaymentDone,
                    );
                  },
                );
              },
            )),
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
          Text(
            "Transactions",
            style: headingStyle,
          ),
          TabBar(
              //isScrollable: false,
              indicatorSize: TabBarIndicatorSize.label,
              onTap: (index) {
                setState(() {});
              },
              indicator: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              controller: _tabController,
              tabs: [
                Tab(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 25,
                    decoration: BoxDecoration(
                      color: _tabController.index == 0
                          ? kPrimaryColor
                          : kBoarderColor,
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
                    height: MediaQuery.of(context).size.height / 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: _tabController.index == 1
                          ? kPrimaryColor
                          : kBoarderColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Payouts'),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: _tabController.index == 2
                          ? kPrimaryColor
                          : kBoarderColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Refunds'),
                    ),
                  ),
                ),
              ])
        ],
      ),
    );
  }
}
