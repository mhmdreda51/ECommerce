import 'package:e_commerce/helper/extenstion.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String name, image, description, sized, price, productid;
  // Color color;

  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.productid,
      // this.color,
      this.sized,
      this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    // color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productid = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      // 'color': color,
      'sized': sized,
      'price': price,
      'productid': productid,
    };
  }
}
