import 'package:ecommerceapptotrial/controller/auth/notification_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationMessage extends StatelessWidget {
  const NotificationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller=Get.put(NotificationController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
           const Center(
                child: Text(
              "Notification",
              style: TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            )),
         const   SizedBox(height: 10,),
            ...List.generate(controller.data.length, (index)=>Container(
              margin:const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                ListTile(
                  title: Text(controller.data[index]['notification_title']),
                  subtitle: Text(controller.data[index]['notification_body']),
                ),
                Positioned(
                  right: 5,
                  child: Text("${controller.data[index]['notification_datetime']}"))
              ],),

            ))
          ],
        ),
      ),
    );
  }
}
