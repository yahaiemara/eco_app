import 'package:ecommerceapptotrial/view/screen/auth/homepage/homepage.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/notification.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/offer.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class HomeScreenController extends GetxController {
  chagePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const Homepage(),
    const NotificationMessage(),
    const Offer(),
    const Setting(),
  ];

  List titleappbar = [
    {
      "title": "home",
      "icon": Icons.home,
    },
    {
      "title": "Na",
      "icon": Icons.notification_add_outlined,
    },
    {
      "title": "Profile",
      "icon": Icons.person,
    },
    {
      "title": "Settings",
      "icon": Icons.settings,
    },
  ];

  @override
  chagePage(int i) {
    currentpage = i;
    update();
  }
}
