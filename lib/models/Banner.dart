import 'package:flutter/material.dart';

import 'Product.dart';

class Banner {
  final int id;
    String image;
    int categoryId ;
  String text;
 

  Banner({required this.id,required this.image, required this.text, required this.categoryId});

  Banner.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        image = json['image'],
        categoryId = json['category_id']
        ;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': text,
        'image': image,
        'products': categoryId
      };
      
}
