import 'package:ecommerceapptotrial/controller/address/compeleteaddress_controller.dart';
import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';
import 'package:ecommerceapptotrial/view/widget/auth/custtombuttonauth.dart';
import 'package:ecommerceapptotrial/view/widget/auth/custtomtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Completeaddress extends StatelessWidget {
  const Completeaddress({super.key});

@override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CompeleteaddressController controller =
        Get.put(CompeleteaddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details address'),
      ),
      body: Container(
          padding:const EdgeInsets.all(15),
          child: GetBuilder<CompeleteaddressController>(
            builder: (controller) => Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "city",
                      labeltext: "city",
                      iconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "street",
                      labeltext: "street",
                      iconData: Icons.streetview,
                      mycontroller: controller.street,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "name",
                      labeltext: "name",
                      iconData: Icons.near_me,
                      mycontroller: controller.name,
                      valid: (val) {},
                      isNumber: false),
                  CustomButtomAuth(
                    text: "Add",
                    onPressed: () {
                      controller.addAddress() ; 
                    },
                  )
                ])),
          )),
    );
  }
}