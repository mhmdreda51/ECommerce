import 'dart:convert';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorgeData extends GetxController {
  Future<UserModel> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  setUser(UserModel userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(CACHED_USER_DATA, jsonEncode(userModel.toJson()));
  }

  _getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(CACHED_USER_DATA);
    return UserModel.fromJson(jsonDecode(value));
  }

  void deleteUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
