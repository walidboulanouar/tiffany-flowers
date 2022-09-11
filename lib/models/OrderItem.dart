import 'package:flutter/material.dart';

import 'Category.dart';
import 'Feature.dart';

class OrderItem {
       
  int id;
  int orderId;
  int productId;
  String name;
   String image;
  int count;
  double price;
  
  double sizePrice;
  String size;
  int color;
  
  OrderItem({
    required this.id,
    required this.orderId,
    required this.name,
    required this.image,
    required this.color,
    required this.price,
    required this.productId,
    required this.count,
    required this.size,
    required this.sizePrice,
   
    
  });

  OrderItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        orderId = json['order_id'],
        name = json['name'],
        image = json['item_img'],
        color = json['color'],
        price = double.parse(json['price']),
        productId = json['product_id'],
        count = json['quantity'],
        size = json['size'],
        sizePrice = double.parse(json['size_price'])
        ;
        
        

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'images': images,
  //       'favorite': favorite,
  //       'product_related': product_related,
  //       'description': description,
  //       'features': features,
  //       'price': price
  //     };
}
