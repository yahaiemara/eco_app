import 'package:ecommerceapptotrial/controller/auth/favorite_controller.dart';
import 'package:ecommerceapptotrial/controller/auth/items_controller.dart';
import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';

import 'package:ecommerceapptotrial/data/model/itemsmodel.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/homepage.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/listitems.dart';
import 'package:ecommerceapptotrial/view/widget/home/custtomappbar.dart';
import 'package:ecommerceapptotrial/view/widget/home/items/listitems.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/routes.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
     
        body: Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          Custtomappbar(
              text: "43".tr,
              // mycontroller: controller.search!,
              mycontroller: controller.homecontroller.search!,
              onChanged: (val) {
                // controller.checkedsearch(val);
                controller.homecontroller.checkSearch(val);
              },
              onPressedSearch: () {
                controller.homecontroller.onSearchItems();
              },
              onPressedFav: () {
                Get.toNamed(AppRoute.myfavorite);
              }),
          const ListcategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget:!controller.homecontroller.isSearch? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        controllerFav.isFavorite[controller.data[index]
                            ['items_id']] = controller.data[index]['favorite'];
                        return Listitems(
                            active: true,
                            itemsModel:
                                Itemsmodel.fromJson(controller.data[index]));
                      }):ListItemsSearch(ListdataModel: controller.homecontroller.listdata)))
        ],
      ),
    ));
  }
}
