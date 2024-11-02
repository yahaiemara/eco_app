import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custtomtitleorder extends StatelessWidget {
  final String text;
  const Custtomtitleorder({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(Icons.arrow_back)))),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child:  Text(
                        text,
                        style:const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    )),
                   const Spacer(),
                  ],
                ));
  }
}