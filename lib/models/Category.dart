import 'package:flutter/material.dart';

import 'Product.dart';

class Category {
  final int id;
    String image;
  String name;
  List<Product>? products;

  Category({required this.image, required this.name, required this.id,this.products});

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        products = json['products']
        ;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'products': products
      };
      
}
