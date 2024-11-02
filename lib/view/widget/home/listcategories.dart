import 'package:ecommerceapptotrial/controller/auth/homepage_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/core/functions/translationdatabase.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';
import 'package:ecommerceapptotrial/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Listcategories extends GetView<HomepageControllerImp> {
  const Listcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return categories(
              i:index,
                categoriesmodel:
                    Categoriesmodel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class categories extends GetView<HomepageControllerImp> {
  final Categoriesmodel categoriesmodel;
  final int? i;
  const categories( {super.key, required this.categoriesmodel,required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          controller.goToItems(controller.categories,i!,categoriesmodel.categoriesId!);
           print("Selected Category ID: ${categoriesmodel.categoriesId}");
        },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColor.thirdcolor,
                borderRadius: BorderRadius.circular(10)),
            height: 70,
            width: 70,
            child: Image.network(
              "${Apiconnect.imagescategories}/${categoriesmodel.categoriesImage}",
              color: const Color.fromARGB(255, 241, 135, 126),
            ),
          ),
          Text(
            "${translaDataBase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
            style: const TextStyle(
                color: AppColor.black, fontSize: 13, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
