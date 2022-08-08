import 'package:flutter/material.dart';

class Category {
  final int id;
  final String image;
  final String name;

  Category({required this.image, required this.name, required this.id}) {}

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
      
}
