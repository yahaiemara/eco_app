import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/data/model/cartview.dart';
import 'package:ecommerceapptotrial/data/model/order.dart';
import 'package:ecommerceapptotrial/data/remote/auth/order_data.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrderdetailsController extends GetxController{
  late OrderModel orderModel;
    OrderData orderData=OrderData(Get.find());
   List<Cartview> data=[];
   late StatusRequest statusRequest;
   
  final MapController mapController = MapController();


  var center = const LatLng(37.7749, -122.4194).obs; // إحداثيات سان فرانسيسكو كمثال
  var zoom = 12.0.obs; // مستوى التكبير الافتراضي

  void moveToLocation(LatLng newCenter) {
    center.value = newCenter;
    mapController.move(newCenter, zoom.value);
  
  }
   getData()async{
    statusRequest=StatusRequest.loading;
    var response=await orderData.getData(orderModel.ordersId!);
    print("=========================Controller: $response");
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      List listdata=response['data'];
      data.addAll(listdata.map((e)=>Cartview.fromJson(e)));
    }else{
      statusRequest=StatusRequest.failure;
    }
    }
    update();
   }
   
  @override
  void onInit() {
    orderModel=Get.arguments['ordermodle'];
    getData();
    super.onInit();
  }

}