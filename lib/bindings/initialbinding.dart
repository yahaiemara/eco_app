import 'package:ecommerceapptotrial/core/class/curd.dart';
import 'package:get/get.dart';

class Initialbinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }
}