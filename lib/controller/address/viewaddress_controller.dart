import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/model/viewaddress.dart';
import 'package:ecommerceapptotrial/data/remote/auth/address_data.dart';
import 'package:get/get.dart';


class ViewaddressController extends GetxController{
  AddressData addressData=AddressData(Get.find());
   List<AddressModel> data=[];
   late StatusRequest statusRequest;
   MyServices myServices=Get.find();
   deleteAddress(String id){
addressData.delete(id);
data.removeWhere((element)=>element.addressId ==id);
update();
   }
   getData()async{
    statusRequest=StatusRequest.loading;
    var response=await addressData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      List lisdata=response['data'];
      data.addAll(lisdata.map((e)=>AddressModel.fromJson(e)));
      if(data.isEmpty){
        statusRequest=StatusRequest.failure;
      }
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