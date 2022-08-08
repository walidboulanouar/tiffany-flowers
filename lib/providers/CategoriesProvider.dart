import 'package:ecomerceapp/models/Category.dart';
import 'package:flutter/material.dart';

class CategoriesProvider with ChangeNotifier {
  List<Category> _categories = [];
  

  List<Category> get categories => _categories;
  
    set categories(List<Category> list) {
    _categories = list;
    notifyListeners();
  }
  
}