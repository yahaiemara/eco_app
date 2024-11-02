import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/remote/auth/notification.dart';
import 'package:get/get.dart';


class NotificationController extends GetxController{



  NotificationData notificationData=NotificationData(Get.find());
   List data=[];
   late StatusRequest statusRequest;
   MyServices myServices=Get.find();
   getData()async{
    statusRequest=StatusRequest.loading;
    var response=await notificationData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      data.addAll(response['data']);
    }else{
      statusRequest=StatusRequest.failure;
    }
    }
    update();
   }
   @override
  void onInit() {
    getData();
    super.onInit();
  }
}
