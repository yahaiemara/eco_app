import 'package:ecommerceapptotrial/controller/address/viewaddress_controller.dart';
import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/data/model/viewaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addressview extends StatelessWidget {
  const Addressview({super.key});

  @override
  Widget build(BuildContext context) {
    ViewaddressController controller = Get.put(ViewaddressController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Address"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addaddress);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<ViewaddressController>(
            builder: (controller) =>
                Handlingdataview(statusRequest: controller.statusRequest, widget: Container(
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context,index){
                    return CardAddressView(addressModel: controller.data[index],onPressed: (){
                      controller.deleteAddress(controller.data[index].addressId!);
                    },);
                  }),
                ))));
  }
}
class CardAddressView extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onPressed;
  const CardAddressView({super.key, required this.addressModel, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(children: [
          ListTile(title: Text("${addressModel.addressName}"),
          subtitle: Text("${addressModel.addressCity} ${addressModel.addressStreet}"),
          trailing: IconButton(onPressed:onPressed, icon:const Icon(Icons.delete_outline_outlined)),
          )
        ],),
      ),
    );
  }
}