import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapptotrial/controller/auth/favorite_controller.dart';
import 'package:ecommerceapptotrial/controller/auth/offer_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/core/constant/imageasset.dart';
import 'package:ecommerceapptotrial/core/functions/translationdatabase.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';
import 'package:ecommerceapptotrial/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Listitemsoffer extends GetView<OfferController> {
  final Itemsmodel itemsModel;
  // final bool active;
  const Listitemsoffer({super.key, required this.itemsModel, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
    
      },
      child: Card(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "${itemsModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Apiconnect.imagesitems}/${itemsModel.itemsImages}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "${translaDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                  style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Rating 3.5",
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 22,
                      child: Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    size: 15,
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${itemsModel.itemsPriceDiscount} \$",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  "1") {
                                controller.setfavorite(itemsModel.itemsId, "0");
                                controller.removefavorite(itemsModel.itemsId!);
                              } else {
                                controller.setfavorite(itemsModel.itemsId, "1");
                                controller.addFavorite(itemsModel.itemsId!);
                              }
                            },
                            icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined)))
                  ],
                )
              ],
            ),
          ),
      if(itemsModel.itemsDiscount!="0")Positioned(
            left: 4,
            top: 4,
            child: Image.asset(AppImageAsset.saleone,width: 40,))   
        ]),
      ),
    );
  }
}
