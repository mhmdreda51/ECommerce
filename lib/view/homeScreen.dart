import 'package:e_commerce/core/services/view_model/Home_view_model.dart';
import 'package:e_commerce/view/detailsView.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Category",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _listViewCategory(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 16,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _listViewProduct(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

Widget _searchTextFormField() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey.shade200,
    ),
    child: TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget _listViewProduct() {
  return GetBuilder<HomeViewModel>(
    init: HomeViewModel(),
    builder: (controller) => Container(
      height: 350,
      child: ListView.separated(
        itemCount: controller.productModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(DetailsView(
                model: controller.productModel[index],
              ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.shade100),
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: controller.productModel[index].name,
                          textAlignment: Alignment.bottomLeft,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: controller.productModel[index].description,
                          textAlignment: Alignment.bottomLeft,
                          color: Colors.grey,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "\$${controller.productModel[index].price}",
                          textAlignment: Alignment.bottomLeft,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, int index) => SizedBox(
          width: 20,
        ),
      ),
    ),
  );
}

Widget _listViewCategory() {
  return GetBuilder<HomeViewModel>(
    init: HomeViewModel(),
    builder: (controller) => Container(
      height: 100,
      child: ListView.separated(
        itemCount: controller.categoryModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.grey.shade100),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network(controller.categoryModel[index].image),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: controller.categoryModel[index].name,
              )
            ],
          );
        },
        separatorBuilder: (context, int index) => SizedBox(
          width: 20,
        ),
      ),
    ),
  );
}
