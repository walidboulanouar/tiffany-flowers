import 'package:ecomerceapp/models/CartItem.dart';
import 'package:ecomerceapp/models/Category.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  set items(List<CartItem> list) {
    _items = list;
    notifyListeners();
  }
  deleteItems(){
    _items.clear();
  }

  int get count => _items.length;
  int  itemCount(){
    int count = 0;
    _items.forEach((item) {
      count += item.count;
    });
    return count;
  }

  addToCart(CartItem item) {
   
    _items.add(item);
    notifyListeners();
  }

  removeFromCart(int itemId) {
    _items.removeWhere((item) => item.productId == itemId);
    notifyListeners();
  }

  int subTotal() {
    int subTotal = 0;
    _items.forEach((item) {
      subTotal += (item.price + item.sizePrice) * item.count;
    });
    return subTotal;
  }

  int Total() {
    int total = subTotal();
    _items.forEach((item) {
      total += (subTotal()*0.05).toInt() ;
      
    });
    return total;
  }

  updateItemCount(int itemId,int count) {
    _items[_items.indexWhere((element) => element.productId == itemId)]
        .setCount(count);

    notifyListeners();
  }
}
