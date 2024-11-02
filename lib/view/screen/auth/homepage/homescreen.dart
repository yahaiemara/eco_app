import 'dart:io';

import 'package:ecommerceapptotrial/controller/auth/home_screen_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/view/widget/home/bottomnavigationbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoute.mycart);
              },
              child: const Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const Bottomnavigationbar(),
            // ignore: deprecated_member_use
            body: WillPopScope(
                onWillPop: () { 
                  Get.defaultDialog(
                    title: "Warning",
                    middleText: "Are You Sure To Exit To App",
                    titleStyle:const TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),
                    onConfirm: (){
                      exit(0);
                    },
                    confirmTextColor: AppColor.secoundcolor,
                    cancelTextColor: AppColor.secoundcolor,
                    buttonColor: AppColor.thirdcolor,
                    onCancel: (){}
                  );
                  return Future.value(false);
                 },
                child: controller.listpage.elementAt(controller.currentpage),
            
                )));
  }
}
