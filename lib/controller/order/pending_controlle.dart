

import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/model/order.dart';
import 'package:ecommerceapptotrial/data/remote/auth/pending.dart';
import 'package:get/get.dart';

class PendingControlle extends GetxController {
  PendingData pendingData = PendingData(Get.find());
  MyServices myServices = Get.find();
  late OrderModel orderModel;
  List<OrderModel> data = [];
  late StatusRequest statusRequest;
  
  String PrintPaymenMethod(String val){
  if(val=="0"){
    return "Cash On Delivery";
}else{
  return "Payment Card";
}
  }
  String PrintDeliveryType(String val){
    if(val=="0"){
      return "Delivery";
    }else
    {
      return "Revice";
    }
  }
  String PrintStatus(String val){
    if(val=="0"){
      return "await Approval";
    }else if(val=="1"){
      return "The Order is been Approved";
    }else if(val=="2"){
      return "On The Way";
    }
    else{
      return "Archive";
    }
  }
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData
        .getData(myServices.sharedPreferences.getString("id")!);
        print("=====================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrderModel.fromJson(e)));
        
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
   delete(String orderid)async{
    statusRequest=StatusRequest.loading;
    var response=await pendingData.deleteData(orderModel.ordersId!);
    print("=========================Controller: $response");
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
   refrespage();
    }else{
      statusRequest=StatusRequest.failure;
    }
    }
    update();
   }
  refrespage(){
    getData();
  }
  @override
  void onInit() {
   getData();
    super.onInit();
  }
}
