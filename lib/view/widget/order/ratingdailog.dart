// ignore_for_file: non_constant_identifier_names



import 'package:ecommerceapptotrial/controller/order/archive_controller.dart';
import 'package:ecommerceapptotrial/core/constant/imageasset.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';

  void ShowDialogRating(BuildContext context,String orderid){

    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) =>       RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title:const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message:const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(AppImageAsset.logo,width: 200,height: 200,),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ArchiveController controller=Get.find();
        controller.submitRating(orderid, response.comment, response.rating);
        print('rating: ${response.rating}, comment: ${response.comment}');
      },
    )
    );
  }