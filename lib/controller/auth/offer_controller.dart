import 'package:ecommerceapptotrial/controller/auth/homepage_controller.dart';
import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/data/model/itemsmodel.dart';
import 'package:ecommerceapptotrial/data/remote/auth/offer.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class OfferController extends SearchMixController{
  OfferData offerData=OfferData(Get.find());
   List<Itemsmodel> data=[];
   @override
  late StatusRequest statusRequest;
   getData()async{
    statusRequest=StatusRequest.loading;
    var response=await offerData.getData();
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      List listdatas=response['data'];
      data.addAll(listdatas.map((e)=>Itemsmodel.fromJson(e)));
    }else{
      statusRequest=StatusRequest.failure;
    }
    }
    update();
   }
   @override
  void onInit() {
    search=TextEditingController();
    getData();
    super.onInit();
  }
}