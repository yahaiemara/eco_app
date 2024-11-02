import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:flutter/material.dart';

class Bottomcart extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const Bottomcart({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textbutton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}