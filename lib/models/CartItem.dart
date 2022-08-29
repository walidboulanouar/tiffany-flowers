import 'package:flutter/material.dart';

import 'Product.dart';

class CartItem {

  int productId;
  String name;
  int color;
  int count;
  String image;
  int price;
  int sizePrice;
  String size;

  CartItem({required this.productId,required this.name,required this.image,required this.sizePrice, required this.color, required this.count,required this.price, required this.size,});

 setCount(int c) {
   count=c;
  }
 

  
      
}
