import 'package:ecommerceapptotrial/controller/auth/homepage_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/core/functions/translationdatabase.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';
import 'package:ecommerceapptotrial/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Listitemshoem extends GetView<HomepageControllerImp> {
  const Listitemshoem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return items(itemsmodel: Itemsmodel.fromJson(controller.items[i]));
          }),
    );
  }
}

class items extends GetView<HomepageControllerImp> {
  final Itemsmodel itemsmodel;
  const items({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToPageProductDetails(itemsmodel);
      },
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${Apiconnect.imagesitems}/${itemsmodel.itemsImages}",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 120,
            width: 170,
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
              left: 15,
              child: Text(
                "${translaDataBase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
