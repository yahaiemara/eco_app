import 'package:ecommerceapptotrial/core/class/statusrequest.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';


class AddressController extends GetxController {
  StatusRequest statusRequest=StatusRequest.none;
  final MapController mapController = MapController();


  var center = const LatLng(37.7749, -122.4194).obs; // إحداثيات سان فرانسيسكو كمثال
  var zoom = 12.0.obs; // مستوى التكبير الافتراضي

  void moveToLocation(LatLng newCenter) {
    center.value = newCenter;
    mapController.move(newCenter, zoom.value);
  
  }
}



