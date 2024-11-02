import 'package:ecommerceapptotrial/controller/auth/favorite_controller.dart';

import 'package:ecommerceapptotrial/controller/auth/offer_controller.dart';
import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/homepage.dart';

import 'package:ecommerceapptotrial/view/widget/home/custtomappbar.dart';
import 'package:ecommerceapptotrial/view/widget/offer/ListItemsoffer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OfferController controller = Get.put(OfferController());
    // ignore: unused_local_variable
    FavoriteController controllerFav = Get.put(FavoriteController());
    
   
    return GetBuilder<OfferController>(
          builder: (controller) =>  Container(
            padding:const EdgeInsets.all(10),
            child: ListView(children: [
              Custtomappbar(
                    text: "43".tr,
                    mycontroller: controller.search!,
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onPressedFav: () {
                      Get.toNamed(AppRoute.myfavorite);
                    }),
               !controller.isSearch ?  Handlingdataview(
                statusRequest: controller.statusRequest, 
                widget: ListView.builder(
                  physics:const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder: (context,index)=>Listitemsoffer(itemsModel: controller.data[index],))
                  ): ListItemsSearch(ListdataModel: controller.listdata)
            ],),
          )
                  
                  );
   
  }
}

