class CardProductModel {
  String name, image, price, productid;
  int quantity;

  CardProductModel(
      {this.name, this.image, this.price, this.quantity, this.productid});

  CardProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productid = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productid': productid,
    };
  }
}
