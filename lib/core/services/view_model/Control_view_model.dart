import 'package:e_commerce/view/card_view.dart';
import 'package:e_commerce/view/homeScreen.dart';
import 'package:e_commerce/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  Widget currentScreen = HomeView();

  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  void changeSelectedValue(int, selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeView();
          break;
        }
      case 1:
        {
          currentScreen = CardView();
          break;
        }
      case 2:
        {
          currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
