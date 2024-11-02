import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapptotrial/controller/auth/myfavorite_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/core/functions/translationdatabase.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';
import 'package:ecommerceapptotrial/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CusttomListFavorite extends GetView<MyfavoriteController> {
  final MyfavoriteitModel itemsModel;
  // final bool active;
  const CusttomListFavorite({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
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
                  Text("${itemsModel.itemsPrice} \$",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () {
                        controller.deleteData(itemsModel.favoriteId!);
                      },
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: AppColor.primaryColor,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
