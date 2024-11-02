import 'package:ecommerceapptotrial/controller/auth/items_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListcategoriesItems extends GetView<ItemsControllerImp> {
  const ListcategoriesItems({super.key});

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

class categories extends GetView<ItemsControllerImp> {
  final Categoriesmodel categoriesmodel;
  final int? i;
  const categories( {super.key, required this.categoriesmodel,required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          // controller.gotoitems(controller.categories,i!);
          controller.changecat(i!,categoriesmodel.categoriesId!);
        },
      child: Column(
        children: [
       
         GetBuilder<ItemsControllerImp>(builder: (controller)=> Container(
          padding:const EdgeInsets.only(bottom: 5),
            decoration:controller.selectedcat==i?const BoxDecoration(
              border: Border(bottom: BorderSide(width: 3,color: AppColor.primaryColor))
            ):null,
            child: Text(
              "${categoriesmodel.categoriesName}",
              style:  TextStyle(
                  color: AppColor.grey2, fontSize: 20,),
            ),
          ))
        ],
      ),
    );
  }
}
