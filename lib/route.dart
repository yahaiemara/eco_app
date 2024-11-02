import 'package:ecommerceapptotrial/core/constant/routes.dart';
import 'package:ecommerceapptotrial/core/middleware/mymiddleware.dart';
import 'package:ecommerceapptotrial/view/screen/address/addaddress.dart';

import 'package:ecommerceapptotrial/view/screen/address/addressview.dart';
import 'package:ecommerceapptotrial/view/screen/address/completeaddress.dart';
import 'package:ecommerceapptotrial/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceapptotrial/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/cart.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/checkout.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/favorite.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/homepage.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/homescreen.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/items.dart';
import 'package:ecommerceapptotrial/view/screen/auth/homepage/productdetails.dart';
import 'package:ecommerceapptotrial/view/screen/auth/language.dart';
import 'package:ecommerceapptotrial/view/screen/auth/login.dart';
import 'package:ecommerceapptotrial/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceapptotrial/view/screen/auth/onboarding.dart';
import 'package:ecommerceapptotrial/view/screen/auth/signup.dart';
import 'package:ecommerceapptotrial/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerceapptotrial/view/screen/auth/success_signup.dart';
import 'package:ecommerceapptotrial/view/screen/auth/verfiycode_signup.dart';
import 'package:ecommerceapptotrial/view/screen/order/archive.dart';
import 'package:ecommerceapptotrial/view/screen/order/orderdetails.dart';
import 'package:ecommerceapptotrial/view/screen/order/pending.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language() , middlewares: [
    MyMiddleWare()
  ]),
  GetPage(name: AppRoute.mycart, page: ()=>const Cart()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.homescreen, page: () => const Homescreen()),
  GetPage(name: AppRoute.home, page: () => const Homepage()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const Productdetails()),
  GetPage(name: AppRoute.myfavorite, page: ()=>const Favorite()),
  GetPage(name: AppRoute.checkout, page: ()=>const Checkout()),
  GetPage(name: AppRoute.pending, page: ()=>const Pending()),
  GetPage(name: AppRoute.orderdetails, page: ()=>const Orderdetails()),
  GetPage(name: AppRoute.archive, page: ()=>const Archive()),
  GetPage(name: AppRoute.viewaddress, page: ()=>const Addressview()),
  GetPage(name:AppRoute.addaddress,page: ()=>const Addaddress()),
  GetPage(name: AppRoute.compeleteaddress, page: ()=>const Completeaddress())
];
 