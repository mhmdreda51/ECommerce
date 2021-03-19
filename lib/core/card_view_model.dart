import 'package:e_commerce/core/database/card_database_helped.dart';
import 'package:e_commerce/model/CARD_PRODUCT_MODEL.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CardDatabaseHelped.db;

  List<CardProductModel> _cardProductModel = [];
  List<CardProductModel> get cardProductModel => _cardProductModel;

  CardViewModel() {
    getAllProduct();
  }

  addProduct(CardProductModel cardProductModel) async {
    for (int i = 0; i < _cardProductModel.length; i++) {
      if (_cardProductModel[i].productid == cardProductModel.productid) {
        return;
      }
    }
    await dbHelper.insert(cardProductModel);
    _cardProductModel.add(cardProductModel);
    _totalPrice +=
        (double.parse(cardProductModel.price) * cardProductModel.quantity);

    update();
  }

  getAllProduct() async {
    _loading.value = true;

    var dbHelper = CardDatabaseHelped.db;
    _cardProductModel = await dbHelper.getAllProduct();
    print(_cardProductModel.length);

    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cardProductModel.length; i++) {
      _totalPrice += (double.parse(_cardProductModel[i].price) *
          _cardProductModel[i].quantity);
      print(_totalPrice);
      update();
    }
  }

  increaseQuantity(int index) async {
    _cardProductModel[index].quantity++;
    _totalPrice += (double.parse(_cardProductModel[index].price));
    await dbHelper.updateProduct(_cardProductModel[index]);

    update();
  }

  decreaseQuantity(int index) async {
    _cardProductModel[index].quantity--;
    _totalPrice -= (double.parse(_cardProductModel[index].price));
    await dbHelper.updateProduct(_cardProductModel[index]);

    update();
  }
}
