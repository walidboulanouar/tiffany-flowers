import 'package:flutter/material.dart';

import '../models/Product.dart';

class WishListProvider with ChangeNotifier {
  List<int> _wishList = [];
  List<Product> _wishListProducts = [];

  List<Product> get wishListProducts => _wishListProducts;

  set wishListProducts(List<Product> list) {
    _wishListProducts = list;
    notifyListeners();
  }

  int get count => _wishList.length;
  List<int> get wishList => _wishList;
  set wishList(List<int> list) {
    _wishList = list;
    notifyListeners();
  }

  addToWishList(int productId) {
    _wishList.add(productId);
    notifyListeners();
  }

  removeFromWishList(int productId) {
    _wishList.removeWhere(((id) => id == productId));
    notifyListeners();
  }
}
