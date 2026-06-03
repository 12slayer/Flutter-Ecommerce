import 'package:flutter/material.dart';

import 'Shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Nike',
      price: '200',
      imagePath: 'lib/images/nikeshoe.jpg',
      description:
          'this shoes is wonderful so that it can be comfortable to use it',
    ),
    Shoe(
      name: 'Nike',
      price: '280',
      imagePath: 'lib/images/nike2.jpg',
      description:
          'this shoes is wonderful so that it can be comfortable to use it',
    ),

    Shoe(
      name: 'Jordan',
      price: '240',
      imagePath: 'lib/images/jordan.jpg',
      description: 'cool shoes',
    ),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
