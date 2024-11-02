import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapptotrial/controller/auth/productdetails_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Stackprodcutdetails extends GetView<ProductDetailsControllerImp> {
  const Stackprodcutdetails({super.key});
  @override
  Widget build(BuildContext context) {
    return    Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        )),
                  ),
                  Positioned(
                    top: 50.0,
                    right: Get.width / 8,
                    left: Get.width / 8,
                    child: Hero(
                      tag: "${controller.itemsModel.itemsId}",
                      child: CachedNetworkImage(
                          imageUrl:
                              "${Apiconnect.imagesitems}/${controller.itemsModel.itemsImages!}"),
                    ),
                  )
                ],
              );
  }
}