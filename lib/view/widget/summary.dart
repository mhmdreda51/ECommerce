import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/card_view_model.dart';
import 'package:e_commerce/core/services/view_model/checkout_viewmodel.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CardViewModel>(
        init: CardViewModel(),
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.cardProductModel.length,
                itemBuilder: (context, index) => Container(
                  child: Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 180,
                          child: Image.network(
                            controller.cardProductModel[index].image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        CustomText(
                          maxLines: 1,
                          text: controller.cardProductModel[index].name,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          color: primaryColor,
                          textAlignment: Alignment.bottomLeft,
                          text:
                              "\$ ${controller.cardProductModel[index].price.toString()}",
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 15,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Shipping Address",
                fontSize: 24,
              ),
            ),
            GetBuilder<CheckOutViewModel>(
                init: Get.find(),
                builder: (controller) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        fontSize: 24,
                        color: Colors.grey,
                        text:
                            "${controller.street1 + ',' + controller.street2 + "," + controller.city + ',' + controller.state + ',' + controller.country}",
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
