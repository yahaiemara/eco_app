import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/remote/auth/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompeleteaddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? name;
  TextEditingController? street;
  TextEditingController? city;
   String? lat;
   String? long;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
 

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.add(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       Get.offAllNamed(AppRoute.homescreen);
        Get.snackbar("Erorr", "Now , You Can Order");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
