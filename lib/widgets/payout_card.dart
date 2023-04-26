import 'package:flutter/material.dart';

import '../../constants.dart';


class PayoutCard extends StatelessWidget {
  const PayoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height /8,
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
                     Container(
                       height: MediaQuery.of(context).size.height/12,
                       //width: MediaQuery.of(context).size.width/8,
                       decoration: BoxDecoration(
                         //color: Colors.red,
                           borderRadius: BorderRadius.circular(8)
                       ),
                         child: Image.network("https://assets.ajio.com/medias/sys_master/root/20221109/SI6r/636b8e9af997ddfdbd663ee4/-473Wx593H-461119105-blue-MODEL.jpg",fit: BoxFit.contain,),
                     ),
                     const SizedBox(
                       width: 15,
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Order #1688068",style: headingStyle,),
                         Text("jul 12 02:06 PM",style: subheadingStyle,)
                       ],
                     ),
                     const Spacer(),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text("₹799",style: TextStyle(color: kPrimaryColor),),
                         Row(
                           children: [
                             Icon(Icons.circle,color: kSecondaryColor1,size: 10,),
                             Text("Successful",style: subheadingStyle,),
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
}
