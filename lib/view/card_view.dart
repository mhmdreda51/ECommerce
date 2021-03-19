import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/card_view_model.dart';
import 'package:e_commerce/view/check_out/checkoutview.dart';
import 'package:e_commerce/view/widget/custom_Button.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        body: controller.cardProductModel.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "lib/assets/menu_icon/card_empty.svg",
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "Card Empty",
                    textAlignment: Alignment.topCenter,
                    fontSize: 30,
                  )
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                        itemBuilder: (contex, index) {
                          return Container(
                            color: Colors.grey.shade100,
                            height: 140.0,
                            child: Row(
                              children: [
                                Container(
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Image.network(
                                      controller.cardProductModel[index].image),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller
                                            .cardProductModel[index].name,
                                        fontSize: 24,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        color: primaryColor,
                                        text:
                                            "${controller.cardProductModel[index].price}",
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 140,
                                        color: Colors.grey.shade200,
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            CustomText(
                                              text: controller
                                                  .cardProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              textAlignment: Alignment.center,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 20),
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .decreaseQuantity(index);
                                                },
                                                child: Icon(
                                                  Icons.minimize,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: controller.cardProductModel.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 15,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: "Total",
                              fontSize: 22,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            GetBuilder<CardViewModel>(
                              init: Get.find(),
                              builder: (controller) => CustomText(
                                text: "\$ ${controller.totalPrice}",
                                fontSize: 18,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(20),
                          width: 180,
                          child: CustomButton(
                            onPressed: () {
                              Get.to(CheckOutView());
                            },
                            text: "CHECK OUT",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
