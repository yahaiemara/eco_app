import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';

import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/model/viewaddress.dart';
import 'package:ecommerceapptotrial/data/remote/auth/address_data.dart';
import 'package:ecommerceapptotrial/data/remote/auth/checkout_data.dart';

import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressid="0";
  late String couponid;
  late String discountcoupon;
  late String priceorder;
  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid=dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checout() async {
    if(paymentMethod ==null) {return Get.snackbar("Erorr", "Please Choose Payment Method");}
    if(deliveryType ==null){ return Get.snackbar("Erorr", "Please Choose Deliver Type");}
    if(dataaddress.isEmpty){ return Get.snackbar("Erorr", "Please Select  Address");}
    statusRequest = StatusRequest.loading;
    update();
 Map data={
  "usersid":myServices.sharedPreferences.getString("id"),
  "addressid":addressid.toString(),
  "orderstype":deliveryType.toString(),
  "pricedelivery":"10",
  "orderprice":priceorder,
  "couponid":couponid,
  "orderpayment":paymentMethod.toString(),
  "coupondiscount":discountcoupon

 };
    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
       Get.toNamed(AppRoute.homescreen);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    discountcoupon=Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
