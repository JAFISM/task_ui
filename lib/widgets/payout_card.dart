import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PayoutCard extends StatelessWidget {
  //late payout=PayoutModel();
  PayoutCard(
      {Key? key,
      required this.amount,
      required this.orderId,
      required this.paymentDone})
      : super(key: key);

  String? amount;
  String? orderId;
  bool? paymentDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: kBackgroundColor,
          border: Border(bottom: BorderSide(width: 1.5, color: kBoarderColor))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                productCard(context),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #$orderId",
                      style: headingStyle,
                    ),
                    Text(
                      "jul 12 02:06 PM",
                      style: subheadingStyle,
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹$amount",
                      style: TextStyle(color:paymentDone==false?Colors.red.shade300:kPrimaryColor),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color:paymentDone==false? Colors.red.shade300:kSecondaryColor1,
                          size: 8,
                        ),
                        Container(
                          child: Text(paymentDone==false?"failed":"Success",
                            style: TextStyle(color:paymentDone==false?Colors.red.shade300:kSecondaryColor1 ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Text("₹799  deposited to:588696398655585899")
        ],
      ),
    );
  }

  Container productCard(BuildContext context) {
    return Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width/8,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image:NetworkImage(
                      "https://assets.ajio.com/medias/sys_master/root/20221109/SI6r/636b8e9af997ddfdbd663ee4/-473Wx593H-461119105-blue-MODEL.jpg",
                    ),
                    fit: BoxFit.fill
                  )
                ),
              );
  }
}
// class PayoutCard extends StatelessWidget {
//   PayoutCard({
//     Key? key,
//     required this.amountNotifier,
//     required this.orderIdNotifier,
//     required this.paymentDoneNotifier,
//   }) : super(key: key);
//
//   final ValueNotifier<String> amountNotifier;
//   final ValueNotifier<String> orderIdNotifier;
//   final ValueNotifier<bool> paymentDoneNotifier;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height / 8,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//           color: kBackgroundColor,
//           border: Border(bottom: BorderSide(width: 1.5, color: kBoarderColor))),
//       child: ValueListenableBuilder(
//         valueListenable: paymentDoneNotifier,
//         builder: (_, paymentDone, __) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 margin: const EdgeInsets.symmetric(),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     productCard(context),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Order #${orderIdNotifier.value}",
//                           style: headingStyle,
//                         ),
//                         Text(
//                           "jul 12 02:06 PM",
//                           style: subheadingStyle,
//                         )
//                       ],
//                     ),
//                     const Spacer(),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           "₹${amountNotifier.value}",
//                           style: TextStyle(
//                               color: paymentDone == false
//                                   ? Colors.red.shade300
//                                   : kPrimaryColor),
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.circle,
//                               color: paymentDone == false
//                                   ? Colors.red.shade300
//                                   : kSecondaryColor1,
//                               size: 8,
//                             ),
//                             Container(
//                               child: Text(
//                                 paymentDone == false ? "failed" : "Success",
//                                 style: TextStyle(
//                                     color: paymentDone == false
//                                         ? Colors.red.shade300
//                                         : kSecondaryColor1),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Text("₹799  deposited to:588696398655585899")
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Container productCard(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height / 12,
//       width: MediaQuery.of(context).size.width / 8,
//       decoration: BoxDecoration(
//           color: Colors.grey,
//           borderRadius: BorderRadius.circular(5),
//           image: DecorationImage(
//               image: NetworkImage(
//                 "https://assets.ajio.com/medias/sys_master/root/20221109/SI6r/636b8e9af997ddfdbd663ee4/-473Wx593H-461119105-blue-MODEL.jpg",
//               ),
//               fit: BoxFit.fill)),
//     );
//   }
// }
