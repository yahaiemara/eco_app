import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:flutter/material.dart';

class Productdetailsitems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;
  final String price;
  const Productdetailsitems(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(children: [
        IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
        Container(
          width: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 3),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Text(
            count,
            style: const TextStyle(
                fontSize: 20, height: 1.1, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(onPressed: onRemove, icon: const Icon(Icons.remove))
      ]),
      const Spacer(),
      Text(
        "$price \$",
        style: const TextStyle(
            fontSize: 30, color: AppColor.primaryColor, height: 1.1),
      )
    ]);
  }
}
