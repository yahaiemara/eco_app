
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:flutter/material.dart';


class Cardshippingaddress extends StatelessWidget {
  final String title;
  final String body;
  final bool isactive;
  const Cardshippingaddress({super.key, required this.title, required this.isactive, required this.body});

  @override
  Widget build(BuildContext context) {
    return  Card(
              color:isactive? AppColor.primaryColor:null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child:  ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                      color:isactive? Colors.white:null, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(body,
                    style: TextStyle(
                        color:isactive? Colors.white:null, fontWeight: FontWeight.bold)),
              ),
            );
  }
}