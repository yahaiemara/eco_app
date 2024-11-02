import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/core/constant/imageasset.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/view/widget/checkout/cardshippingaddress.dart';
import 'package:ecommerceapptotrial/view/widget/checkout/cartdeliverytype.dart';
import 'package:ecommerceapptotrial/view/widget/checkout/cartpaymentcheckout.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/checkout_controller.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secoundcolor,
            textColor: Colors.white,
            onPressed: () {
             controller.checout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      const Text(
                        "Choose Payment Method",
                        style: TextStyle(
                            color: AppColor.secoundcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0");
                        },
                        child: Cartpaymentcheckout(
                          title: "Cash On Delivery",
                          isactive:
                              controller.paymentMethod == "0" ? true : false,
                        ),
                      ),
                      const SizedBox(height: 5),
                      InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("1");
                          },
                          child: Cartpaymentcheckout(
                              title: "Payment Card",
                              isactive: controller.paymentMethod == "1"
                                  ? true
                                  : false)),
                      const SizedBox(height: 20),
                      const Text(
                        "Choose Delivery Type",
                        style: TextStyle(
                            color: AppColor.secoundcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("0");
                            },
                            child: Cartdeliverytype(
                                imagename: AppImageAsset.delivery,
                                title: "Delivery",
                                isactive: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1");
                            },
                            child: Cartdeliverytype(
                                imagename: AppImageAsset.deliverythru,
                                title: "Revice",
                                isactive: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (controller.deliveryType =="0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(controller.dataaddress.isNotEmpty)
                            const Text(
                              "Shipping Address",
                              style: TextStyle(
                                  color: AppColor.secoundcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            if(controller.dataaddress.isEmpty)
                            InkWell(
                              onTap: (){
                                Get.toNamed(AppRoute.addaddress);
                              },
                              child: Container(child: Center(child: Text("Please Add Address",style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),)),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(
                                      controller.dataaddress[index].addressId!);
                                },
                                child: Cardshippingaddress(
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    body:
                                        "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                    isactive: controller.addressid ==
                                            controller
                                                .dataaddress[index].addressId
                                        ? true
                                        : false),
                              ),
                            )
                          ],
                        )
                    ],
                  )))),
    );
  }
}
