import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/remote/auth/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController{
  List data=[];
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices=Get.find();
  late StatusRequest statusRequest;
  Map isFavorite={};
  setfavorite(id,val){
isFavorite[id]=val;
update();
  }
addFavorite(String itemsid)async{
   data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.AddFavorite(myServices.sharedPreferences.getString("id")!,itemsid);
    print("=====================controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
           Get.snackbar("اشعار", "تم اضافه المنتج في المفضله");
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
}
removefavorite(String itemsid)async{
data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.RemoveFavorite(myServices.sharedPreferences.getString("id")!,itemsid);
    print("=====================controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
           Get.snackbar("اشعار", "تم حذف المنتج في المفضله");
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
}
}