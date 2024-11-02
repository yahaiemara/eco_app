import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/data/apiconnect/apiconnect.dart';
import 'package:flutter/material.dart';


class Custtomcartitems extends StatelessWidget {
  final String nameitems;
  final String price;
  final String count;
  final String image;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const Custtomcartitems(
      {super.key, required this.nameitems, required this.price, required this.image,required this.onAdd,required this.onRemove, required this.count});

  @override
  Widget build(BuildContext context) {
  
    return Container(
      child: Column(
        children: [
          Card(
            child: Container(
              child: Row(
                children: [
                  Expanded(flex: 2, child: CachedNetworkImage(imageUrl: "${Apiconnect.imagesitems}/$image")),
                  Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text(
                          nameitems,
                          style: const TextStyle(fontSize: 15),
                        ),
                        subtitle: Text(
                          "$price\$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                          child: IconButton(
                              onPressed: onAdd, icon: const Icon(Icons.add)),
                        ),
                        SizedBox(
                          height: 30,
                          child:  Text(
                           count ,
                            style: const TextStyle(fontFamily: 'sans'),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: IconButton(
                              onPressed: onRemove, icon: const Icon(Icons.remove)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
