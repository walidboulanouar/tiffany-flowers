import 'package:ecomerceapp/models/Category.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

class ProductProvider with ChangeNotifier {
  Product? _selectedProduct;
List<Product> _categoryproducts=[];
List<Product> _products=[];
 Product? get selectedProduct => _selectedProduct;

 set selectedProduct(Product? product) {
    _selectedProduct=product;
    notifyListeners();
  }
  List<Product> get categoryproducts => _categoryproducts;
  set categoryproducts(List<Product> list) {
    _categoryproducts = list;
    notifyListeners();
  }
  List<Product> get products => _products;
  set products(List<Product> list) {
    _products = list;
    notifyListeners();
  }
}
