
import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  LoginData loginData=LoginData(Get.find());
  StatusRequest? statusRequest=StatusRequest.none;
  bool isshowpassword = true;
  MyServices myservices=Get.find();
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async{
         var formData = formstate.currentState;
    if (formData!.validate()) {
      formData.save();
     statusRequest=StatusRequest.loading;
     update();
    var response=await loginData.postdata(email.text,password.text);
    print("====================Controller $response");
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
     myservices.sharedPreferences.setString("id",response['user']['users_id']);
     String userid=myservices.sharedPreferences.getString("id")!;
     myservices.sharedPreferences.setString("username",response['user']['users_name']);
     myservices.sharedPreferences.setString("email",response['user']['users_email']);
     myservices.sharedPreferences.setString("phone",response['user']['users_phone']);
     myservices.sharedPreferences.setString("step","2");
     FirebaseMessaging.instance.subscribeToTopic("users");
     FirebaseMessaging.instance.subscribeToTopic("users$userid");

      Get.offNamed(AppRoute.homescreen);
    }if (response['status'] == 'fail') {
  String message = response['message'];
  Get.snackbar(
    "Signup Failed",
    message,  
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    duration:const Duration(seconds: 3),
  );
 }
    else{
      
       statusRequest=StatusRequest.failure;
    }
    }
    update();
    }

  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value){
    // ignore: avoid_print
    print(value);
    // ignore: unused_local_variable
    String? token=value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}