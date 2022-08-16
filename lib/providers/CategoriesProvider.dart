import 'package:ecomerceapp/models/Category.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

class CategoriesProvider with ChangeNotifier {
  List<Category> _categories = [];
  List<Product> _products=[];

  List<Category> get categories => _categories;
  List<Product> get products => _products;
  set categories(List<Category> list) {
    _categories = list;
    notifyListeners();
  }
  set products(List<Product> list) {
    _products = list;
    notifyListeners();
  }
}
