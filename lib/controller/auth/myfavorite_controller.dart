import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/model/myfavorite.dart';
import 'package:ecommerceapptotrial/data/remote/auth/favoriteview.dart';
import 'package:get/get.dart';

class MyfavoriteController extends GetxController {
  List<MyfavoriteitModel> data = [];
  MyFavorite myfavorite = MyFavorite(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await myfavorite.getData(myServices.sharedPreferences.getString("id")!);
    print("=====================controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyfavoriteitModel.fromJson(e)));
        print("data:$data");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String favoriteid) {
    // ignore: unused_local_variable
    var response = myfavorite.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
