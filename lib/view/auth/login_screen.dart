import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/services/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/register_view.dart';
import 'package:e_commerce/view/widget/custom_Button.dart';
import 'package:e_commerce/view/widget/custom_buttton_social.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:e_commerce/view/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 30, right: 20, left: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Welcome,",
                        fontSize: 30.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterView());
                        },
                        child: CustomText(
                          text: "Sign Up",
                          color: primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    textAlignment: Alignment.topLeft,
                    text: "Sign in to continue",
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    text: 'Email',
                    hint: "Enter your email address",
                    onSaved: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("error");
                      }
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  CustomTextFormField(
                    text: 'Password',
                    hint: "*************",
                    obscureText: true,
                    onSaved: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("error");
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "Forget password ?",
                    fontSize: 14.0,
                    color: Colors.black,
                    textAlignment: Alignment.topRight,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    onPressed: () {
                      _formKey.currentState.save();

                      if (_formKey.currentState.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    },
                    text: "Sign in",
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  CustomText(
                    text: "-Or-",
                    textAlignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  CusttomButtonSocial(
                    text: "Sign in With Facebook",
                    imageName: "lib/assets/images/facebook.png",
                    onPressed: () {
                      controller.facebookSignInMethod();
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CusttomButtonSocial(
                    text: "Sign in With Google",
                    imageName: "lib/assets/images/google.png",
                    onPressed: () {
                      controller.googleSignInMethod();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
