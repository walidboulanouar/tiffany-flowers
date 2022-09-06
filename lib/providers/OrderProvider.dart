import 'package:ecomerceapp/models/Category.dart';
import 'package:flutter/material.dart';

import '../models/Order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  List<String> _ordersImages = [];
  

  List<Order> get orders => _orders;
  List<String> get ordersImages => _ordersImages;
  addToImages(String img) {
   
    _ordersImages.add(img);
    notifyListeners();
  }
  set orders(List<Order> list) {
    _orders = list;
    notifyListeners();
  }
  removeOrders(){
    _orders.clear();
    notifyListeners();
  }
  // set products(List<Product> list) {
  //   _products = list;
  //   notifyListeners();
  // }
}
