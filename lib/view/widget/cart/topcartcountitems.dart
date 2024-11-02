import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:flutter/material.dart';

class Topcartcountitems extends StatelessWidget {
  final String text;
  const Topcartcountitems({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // height: 20,
      decoration: BoxDecoration(
          color: AppColor.secoundcolor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
