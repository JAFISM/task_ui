import 'package:flutter/material.dart';
import 'package:task_ui/utils/constants.dart';
import 'package:task_ui/views/payment/components/paymentMethod.dart';
import 'package:task_ui/views/payment/components/payment_overview.dart';
import 'package:task_ui/views/payment/components/transaction_limit.dart';

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
    return  Container(
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
            //color: Colors.green,
            child: ListView.builder(
              itemCount: 10,
                 itemBuilder: (_, index) => PayoutCard(
                     amount:'899',
                    image: "https://assets.ajio.com/medias/sys_master/root/20221109/SI6r/636b8e9af997ddfdbd663ee4/-473Wx593H-461119105-blue-MODEL.jpg",
                   orderId: "9865966", paymentDone: true,
          ),
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
                      color: _tabController.index==0?kPrimaryColor:kBoarderColor,
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
                      color:_tabController.index==1?kPrimaryColor:kBoarderColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Payouts(15)'),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: _tabController.index==2?kPrimaryColor:kBoarderColor,
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
