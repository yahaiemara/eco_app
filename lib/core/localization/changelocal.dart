import 'package:ecommerceapptotrial/core/constant/apptheme.dart';
import 'package:ecommerceapptotrial/core/functions/notifaction.dart';
import 'package:ecommerceapptotrial/core/services/services.dart'; 
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  get langcode => null;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }
requestPerLocation()async{
    bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
 if (!serviceEnabled) {
    return Get.snackbar("تنبيه", "الرجاء تشغيل خدمه تحديد الموقع");
  }
    permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
    
         return Get.snackbar("تنبيه", " الرجاء اعطاء صلاحيبه الكوقع للتطبيق");

    }
  }
    if (permission == LocationPermission.deniedForever) {
         return Get.snackbar("تنبيه", "لا يمكن اعطاء تشغيل التطبيق من دون صلاحيه");

  } 
}
  @override
  void onInit() {
    RequestPremissionNotifaction();
    fcmnotif();
   requestPerLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}