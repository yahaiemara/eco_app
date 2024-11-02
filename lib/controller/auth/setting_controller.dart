import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController{
  logout();
}
class SettingControllerImp extends SettingController{
  MyServices myServices=Get.find();
  @override
  logout() {
    String userid=myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPreferences.clear();
    Get.offNamed(AppRoute.login);
    
  }

}