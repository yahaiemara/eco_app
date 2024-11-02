import 'package:ecommerceapptotrial/controller/onboarding_controller.dart';
import 'package:ecommerceapptotrial/core/constant/color.dart';
import 'package:ecommerceapptotrial/view/widget/onboarding/custtombutton.dart';
import 'package:ecommerceapptotrial/view/widget/onboarding/custtomslider.dart';
import 'package:ecommerceapptotrial/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return const Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}