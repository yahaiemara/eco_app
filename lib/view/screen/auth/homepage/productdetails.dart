import 'package:ecommerceapptotrial/controller/auth/productdetails_controller.dart';
import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/view/widget/prodcutdetails/listsubitemsdetails.dart';
import 'package:ecommerceapptotrial/view/widget/prodcutdetails/productdetailsitems.dart';
import 'package:ecommerceapptotrial/view/widget/prodcutdetails/stackprodcutdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(title:const Text("Product Detials"),),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColor.secoundcolor,
            onPressed: () {
              
              Get.toNamed(AppRoute.mycart);
            },
            child: const Text(
              "Go To Cart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: 
                   ListView(
                    children: [
                      const Stackprodcutdetails(),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.itemsModel.itemsName}",
                              style: TextStyle(
                                  color: AppColor.fourcolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Productdetailsitems(
                                onAdd: () {
                                  controller.add();
                                },
                                onRemove: () {
                                  controller.remove();
                                },
                                count: "${controller.countitems}",
                                price: "${controller.itemsModel.itemsPriceDiscount}"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${controller.itemsModel.itemsDesc}",
                              style: TextStyle(
                                  color: AppColor.grey2, fontSize: 13),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Color",
                              style: TextStyle(
                                  color: AppColor.fourcolor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Listsubitemsdetails(),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
