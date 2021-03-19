import 'package:e_commerce/core/card_view_model.dart';
import 'package:e_commerce/helper/biniding.dart';
import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/theme/theme_services.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CardViewModel());
  runApp(GetMaterialApp(
    initialBinding: Binding(),
    debugShowCheckedModeBanner: false,
    home: ControlView(),
    theme: Themes().lightTheme,
    darkTheme: Themes().darkTheme,
    themeMode: ThemeServices().getThemeMode(),
  ));
}
