import 'package:ecommerceapptotrial/controller/auth/cart_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/view/widget/cart/bottomcart.dart';
import 'package:ecommerceapptotrial/view/widget/cart/custtombottomcoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custtomorderprice extends GetView<CartController> {
  final String price;
  final String discount;
  final TextEditingController controllercoupon;

  final void Function()? onPressedOrder;
  final void Function()? onApplyPressed;
  final String totalprice;
  const Custtomorderprice(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.controllercoupon,
      
      required this.onPressedOrder,required this.onApplyPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => controller.couponname == null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: controllercoupon,
                                decoration: const InputDecoration(
                                    isDense: true,
                                    hintText: "Coupon Code",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    border: OutlineInputBorder()),
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              flex: 1,
                              child: Custtombottomcoupon(
                                onPressed:onApplyPressed,
                                textbutton: "Apply",
                              ))
                        ],
                      ),
                    )
                  : Container(
                      child: Text(
                        "Coupon Code : ${controller.couponname}",
                        style:const TextStyle(color: AppColor.primaryColor,fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    )),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "Price",
                          style: TextStyle(fontSize: 16),
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "$price\$",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "DisCount",
                          style: TextStyle(fontSize: 16),
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "$discount\$",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "Total Price",
                          style: TextStyle(fontSize: 16),
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "$totalprice\$",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Bottomcart(
            textbutton: "Please Order",
            onPressed: onPressedOrder,
          )
        ],
      ),
    );
  }
}
