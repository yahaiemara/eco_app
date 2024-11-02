
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:flutter/material.dart';


class Cartdeliverytype extends StatelessWidget {
  final String imagename;
  final String title;
  final bool isactive;
  const Cartdeliverytype({super.key, required this.imagename, required this.title, required this.isactive});

  @override
  Widget build(BuildContext context) {
    return    Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColor.primaryColor, width: 1),
                     color: isactive?AppColor.primaryColor:null),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Image.asset(
                        imagename,
                        width: 60,
                        color:isactive? Colors.white:null,
                      ),
                       Text(
                        title,
                        style: TextStyle(
                            color:isactive? Colors.white:AppColor.primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
  }
}