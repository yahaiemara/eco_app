import 'package:ecommerceapptotrial/controller/auth/myfavorite_controller.dart';
import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';

import 'package:ecommerceapptotrial/view/widget/favorite/myfavorite.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyfavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
          child: GetBuilder<MyfavoriteController>(
        builder: (controller) => ListView(
          children: [
            // Custtomappbar(
            //     text: "Find Your Favorite",
              
            //     onPressedSearch: () {},
            //     onPressedFav: () {
            //       Get.toNamed(AppRoute.myfavorite);
            //     }),
            Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,childAspectRatio: 0.7),
                    itemBuilder: (context,index){
             return CusttomListFavorite(itemsModel: controller.data[index]);
                    }))
          ],
        ),
      )),
    );
  }
}
