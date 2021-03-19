import 'package:e_commerce/helper/local_storge_data.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorgeData localStorgeData = Get.find();
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  UserModel get userModel => _userModel;
  UserModel _userModel;

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorgeData.deleteUser();
  }

  void getCurrentUser() async {
    _loading.value = true;

    await localStorgeData.getUser.then((value) {
      _userModel = value;
      print(value);
    });
    _loading.value = false;

    update();
  }

  void onInit() {
    super.onInit();
  }
}
