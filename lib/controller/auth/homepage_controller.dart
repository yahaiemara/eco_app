import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/core/functions/handlingData.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/data/model/itemsmodel.dart';
import 'package:ecommerceapptotrial/data/remote/auth/home.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomepageController extends SearchMixController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomepageControllerImp extends HomepageController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;

  @override
  Home homedata = Home(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  List settings=[];
  // List items = [];
 String titlehome="";
 String bodyhome="";
 String deliverytime="";
  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settings.addAll(response['settings']['data']);
        titlehome=settings[0]['setting_titlehome'];
        bodyhome=settings[0]['setting_bodyhome'];
        deliverytime=settings[0]['setting_deliverytime'];
        myServices.sharedPreferences.setString("deliverytime", deliverytime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  List<Itemsmodel> listdata = [];

  late StatusRequest statusRequest;
  Home homedata = Home(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.search(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}