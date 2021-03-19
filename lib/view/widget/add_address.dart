import 'package:e_commerce/core/services/view_model/checkout_viewmodel.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:e_commerce/view/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: "Billing address is the same as delivery address",
                    fontSize: 20,
                    textAlignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    text: "Street 1",
                    hint: "21, Alex Davidson Avenue",
                    onSaved: (value) {
                      controller.street1 = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "you must write your street";
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    text: "Street 2",
                    hint: "Opposite Omegatron, Vicent Quarters",
                    onSaved: (value) {
                      controller.street2 = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "you must write your street2";
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    text: "City",
                    hint: "Victoria Island",
                    onSaved: (value) {
                      controller.city = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "you must write your city";
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CustomTextFormField(
                              obscureText: false,
                              text: "State",
                              hint: "Lagos State",
                              onSaved: (value) {
                                controller.state = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "you must write your state";
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CustomTextFormField(
                              obscureText: false,
                              text: "Lagos State",
                              hint: "Nigeria",
                              onSaved: (value) {
                                controller.country = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "you must write your Country";
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
