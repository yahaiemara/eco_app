import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/data/remote/auth/singup.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';

import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  SignUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
   SignupData signupData=SignupData(Get.find());
   List data=[];
  StatusRequest? statusRequest=StatusRequest.none;
   bool isshowpassword = true;
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
  @override
SignUp() async{
     var formData = formstate.currentState;
    if (formData!.validate()) {
      formData.save();
     statusRequest=StatusRequest.loading;
    var response=await signupData.postdata(username.text,password.text,email.text,phone.text);
    print("====================SingUP $response");
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      // data.addAll(response['data']);
      // print(data);
      Get.offNamed(AppRoute.login);
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
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}