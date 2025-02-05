import 'package:ecommerceapptotrial/bindings/initialbinding.dart';
import 'package:ecommerceapptotrial/core/localization/translation.dart';
import 'package:ecommerceapptotrial/core/services/services.dart';
import 'package:ecommerceapptotrial/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme, 
      initialBinding: Initialbinding(),
      // routes: routes,
      getPages: routes,
    );
  }
}