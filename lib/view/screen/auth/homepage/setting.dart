import 'package:ecommerceapptotrial/controller/auth/setting_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/core/constant/imageasset.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller=Get.put(SettingControllerImp());
    return Container(
      child: ListView(
        children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 3,
              color: AppColor.primaryColor,
            ),
            Positioned(
              top: Get.width/3.3,
                child: Container(
                  padding:const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(100)),
                   child: CircleAvatar(
                    radius: 40,
            
                    backgroundColor: Colors.grey[100],
                    backgroundImage:const AssetImage(AppImageAsset.Avatar),
                   ),
            ))
          ],
        ),
      const SizedBox(height: 100,),
      Container(
        padding:const EdgeInsets.symmetric(horizontal: 10),
        child: Card(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                
              },
              title: const Text("Disable Notification"),
              trailing:Switch(value: true, onChanged:(val){} ),
              
              ),
            // Divider(),
             ListTile(
              onTap:(){} ,
              title:const Text("About Us"),
              trailing:const Icon(Icons.help),
              ),
               ListTile(
              onTap: (){
                Get.toNamed(AppRoute.pending);
              },
              title:const Text("Orders"),
              trailing:const Icon(Icons.delivery_dining),
              ),
               ListTile(
              onTap: (){
                Get.toNamed(AppRoute.archive);
              },
              title:const Text("Archive"),
              trailing:const Icon(Icons.delivery_dining),
              ),
            // Divider(),
             ListTile(
              onTap: (){
                Get.toNamed(AppRoute.viewaddress);
              },
              title:const Text("Address"),
              trailing:const Icon(Icons.local_activity_outlined),
              ),

               ListTile(
              onTap: ()async{
                
              await  launchUrl(Uri.parse("tel:+201557835979"));

              },
              title:const Text("Contact Us"),
              trailing:const Icon(Icons.contact_phone_outlined),
              ),
            // Divi
            // Divider(),
             ListTile(
              onTap:(){
                controller.logout();
              } ,
              title:const Text("Logout"),
              trailing:const Icon(Icons.logout_outlined),
              )
          ],),),
      )
      ]),
    );
  }
}
