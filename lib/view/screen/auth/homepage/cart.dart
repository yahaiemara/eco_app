// ignore_for_file: avoid_unnecessary_containers
import 'package:ecommerceapptotrial/controller/auth/cart_controller.dart';
import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';
import 'package:ecommerceapptotrial/view/widget/cart/custtomcartitems.dart';
import 'package:ecommerceapptotrial/view/widget/cart/custtomorderprice.dart';
import 'package:ecommerceapptotrial/view/widget/cart/topcartcountitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget  {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(title:const Text("My Cart"),),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => Custtomorderprice(
       
          controllercoupon:controller.controllercoupon!,
         onPressedOrder: (){controller.goToPageCheckOut();},
              price: "${cartController.priceorders}",
              discount: "${controller.discountcoupon}%",
              totalprice: "${controller.getTotalPrice()}", onApplyPressed: () { controller.checkcoupon(); },),
        ),
        body: GetBuilder<CartController>(
            builder: (controller) => Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                  
                   const SizedBox(
                      height: 10,
                    ),
                    Topcartcountitems(
                        text:
                            "You Have ${cartController.totalcountitems} To Order"),
                    ...List.generate(
                        cartController.data.length,
                        (index) =>  Custtomcartitems(
                              onAdd: ()async {
                                await cartController.add(cartController.data[index].itemsId!);
                                cartController.refreshPage();
                              },
                              onRemove: ()async {
                             await cartController.delete(cartController.data[index].itemsId!);
                             cartController.refreshPage();
                              },
                              nameitems:
                                  "${cartController.data[index].itemsName}",
                              price: "${cartController.data[index].itemsPrice}",
                              image: '${cartController.data[index].itemsImages}', count: "${cartController.data[index].countitems}",
                            ))
                  ],
                ))));
  }
}
