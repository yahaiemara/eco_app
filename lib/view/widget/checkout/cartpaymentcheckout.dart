
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:flutter/material.dart';


class Cartpaymentcheckout extends StatelessWidget {
  final String title;
  final bool isactive;
  const Cartpaymentcheckout({super.key, required this.title, required this.isactive,});

  @override
  Widget build(BuildContext context) {
    return   Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:isactive? AppColor.secoundcolor:AppColor.thirdcolor),
              child:  Text(
                title,
                style:
                    TextStyle(color:isactive? Colors.white:AppColor.primaryColor, fontWeight: FontWeight.bold),
              ),
            );
  }
}