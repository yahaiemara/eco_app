
import 'package:ecommerceapptotrial/controller/auth/homepage_controller.dart';
import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/model/itemsmodel.dart';
import 'package:ecommerceapptotrial/data/remote/auth/items.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changecat(int val,String catval);
  getdata(String categoryid);
  goToProductDetails(Itemsmodel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  HomepageControllerImp homecontroller=Get.put(HomepageControllerImp());
  ItemsData itemsdata = ItemsData(Get.find());
  List data=[];
  String delivery="";
  MyServices myServices=Get.find();
  late StatusRequest statusRequest;
  List categories = [];
  String? catid;
  int? selectedcat;
  @override
  initialData() {
    delivery=myServices.sharedPreferences.getString("deliverytime")!;
    categories = Get.arguments["categories"];
    selectedcat = Get.arguments["selectedcat"];
    catid = Get.arguments["catid"];
    getdata(catid!);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changecat(int val,catval) {
    selectedcat = val;
    catid=catval;
    getdata(catid!);
    update();
  }

  @override
  getdata(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsdata.getData(categoryid,myServices.sharedPreferences.getString("id")!);
    print("=====================controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  goToProductDetails(itemsModel) {
  Get.toNamed(AppRoute.productdetails,arguments: {"itemsmodel":itemsModel});
   
  }
}
