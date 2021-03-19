import 'package:e_commerce/core/services/view_model/auth_view_model.dart';
import 'package:e_commerce/core/services/view_model/Control_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _bottomNavigationBar(),
              ),
            );
    });
  }
}

Widget _bottomNavigationBar() {
  return GetBuilder<ControlViewModel>(
    init: Get.find(),
    builder: (controller) => BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
        elevation: 0.0,
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(int, index);
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Explore",
                style: TextStyle(color: Colors.black),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "lib/assets/images/Icon_Explore.png",
                fit: BoxFit.contain,
                width: 20.0,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Card",
                style: TextStyle(color: Colors.black),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "lib/assets/images/Icon_Cart.png",
                fit: BoxFit.contain,
                width: 20.0,
              ),
            ),
          ),
          BottomNavigationBarItem(
              label: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  "Account",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  "lib/assets/images/Icon_User.png",
                  fit: BoxFit.contain,
                  width: 20.0,
                ),
              )),
        ]),
  );
}
