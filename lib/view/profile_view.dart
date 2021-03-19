import 'package:e_commerce/core/services/view_model/profile_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/settings_view.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                body: Container(
                padding: EdgeInsets.only(top: 70),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: controller.userModel == null
                                            ? AssetImage(
                                                "lib/assets/menu_icon/user.png")
                                            : controller.userModel.pic ==
                                                    "defult"
                                                ? AssetImage(
                                                    'lib/assets/menu_icon/user.png')
                                                : NetworkImage(
                                                    controller.userModel.pic),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  // text: controller.userModel.name,
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                                CustomText(
                                  // text: controller.userModel.email,
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Edit Profile",
                              ),
                              leading: Image.asset(
                                "lib/assets/menu_icon/writing.png",
                                height: 30,
                                width: 30,
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Shipping Address",
                              ),
                              leading: Image.asset(
                                "lib/assets/menu_icon/ip-locator.png",
                                height: 30,
                                width: 30,
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Order History",
                              ),
                              leading: Image.asset(
                                "lib/assets/menu_icon/clock.png",
                                height: 30,
                                width: 30,
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Cards",
                              ),
                              leading: Image.asset(
                                "lib/assets/menu_icon/payment-method.png",
                                height: 30,
                                width: 30,
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Notifications",
                              ),
                              leading: Image.asset(
                                "lib/assets/menu_icon/sound-bell.png",
                                height: 30,
                                width: 30,
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                            onPressed: () {
                              Get.to(SettingsView());
                            },
                            child: ListTile(
                              title: CustomText(
                                text: "Settings",
                              ),
                              leading: Image.asset(
                                "lib/assets/menu_icon/gear.png",
                                height: 30,
                                width: 30,
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                            onPressed: () {
                              controller.signOut();
                              Get.offAll(LoginScreen());
                            },
                            child: ListTile(
                              title: CustomText(
                                text: "Log Out",
                              ),
                              leading: Image.asset(
                                "lib/assets/menu_icon/send-file.png",
                                height: 30,
                                width: 30,
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              )));
  }
}
