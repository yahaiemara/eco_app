import 'package:ecommerceapptotrial/controller/auth/productdetails_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Listsubitemsdetails extends GetView<ProductDetailsControllerImp> {
  const Listsubitemsdetails({super.key});
  @override
  Widget build(BuildContext context) {
    return          Row(
                      children: [
                        // ...List.generate(
                        //   controller.subitems.length,
                        //   (index) => Container(
                        //     alignment: Alignment.center,
                        //     padding: const EdgeInsets.only(bottom: 5),
                        //     height: 60,
                        //     width: 90,
                        //     decoration: BoxDecoration(
                        //       color: AppColor.fourcolor,
                        //       border: Border.all(
                        //           color: controller.subitems[index]["active"] ==
                        //                   "1"
                        //               ? AppColor.fourcolor
                        //               : Colors.white),
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: Text(
                        //       controller.subitems[index]["name"],
                        //       style: TextStyle(
                        //           color: controller.subitems[index]["active"] ==
                        //                   "1"
                        //               ? Colors.white
                        //               : AppColor.fourcolor,
                        //           fontSize: 15,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        // )
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(bottom: 5),
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: AppColor.fourcolor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text("black",style: TextStyle(color: Colors.white),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(bottom: 5),
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.fourcolor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text("blue"),
                        )
                      ],
                    );
  }
}