import 'package:e_commerce/core/services/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/widget/custom_Button.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:e_commerce/view/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginScreen());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomText(
                  text: "Sign Up,",
                  fontSize: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  obscureText: false,
                  text: 'Name',
                  hint: 'Enter your email name',
                  onSaved: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  obscureText: false,
                  text: 'Email',
                  hint: 'Enter your email address',
                  onSaved: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  obscureText: true,
                  text: 'Password',
                  hint: '**********',
                  onSaved: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPressed: () {
                    _formKey.currentState.save();

                    if (_formKey.currentState.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                  text: 'SIGN Up',
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
