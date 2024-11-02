import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapptotrial/controller/auth/homepage_controller.dart';
import 'package:ecommerceapptotrial/core/class/handlingdataview.dart';
import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';
import 'package:ecommerceapptotrial/data/model/itemsmodel.dart';
import 'package:ecommerceapptotrial/view/widget/home/custtomappbar.dart';
import 'package:ecommerceapptotrial/view/widget/home/custtomcard.dart';
import 'package:ecommerceapptotrial/view/widget/home/custtomtitlehome.dart';
import 'package:ecommerceapptotrial/view/widget/home/listcategories.dart';
import 'package:ecommerceapptotrial/view/widget/home/listitemshoem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
   // ignore: unused_local_variable
   HomepageControllerImp controller= Get.put(HomepageControllerImp());
    return GetBuilder<HomepageControllerImp>(
      builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
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
              Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          if(controller.settings.isNotEmpty)  Custtomcard(
                                titletext:
                                    controller.titlehome,
                                bodytext:
                                    controller.bodyhome),
                            Custtomtitlehome(titletext: "42".tr),
                            const Listcategories(),
                            Custtomtitlehome(titletext: "44".tr),
                            const Listitemshoem(),
                          ],
                        )
                      : ListItemsSearch(ListdataModel: controller.listdata)),
            ],
          )),
    );
  }
}

class ListItemsSearch extends StatelessWidget {
  final List<Itemsmodel> ListdataModel;
  const ListItemsSearch({super.key, required this.ListdataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ListdataModel.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${Apiconnect.imagesitems}/${ListdataModel[index].itemsImages}")),
                    Expanded(
                        flex: 2,
                        child: Text("${ListdataModel[index].itemsName}"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
