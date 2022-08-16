import 'package:flutter/material.dart';

import 'Category.dart';
import 'Feature.dart';

class Product {
   int id;
  List<String> images;
  bool favorite;
  List<Product>? product_related;
  int price;
  String description;
  List<Feature>? features;
  String name;
  List<Category>? categories;
  int view;

  Product(
      {
        this.view=0,
        this.categories,
        required this.images,
      required this.name,
      required this.id,
      required this.favorite,
      this.product_related,
      required this.price,
      required this.description,
      required this.features}) {}

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
      view=json['view'],
      categories= List<Category>.from(json['categories'].map((cat)=>Category.fromJson(cat))),
        name = json['name'],
        images = List<String>.from(json['images'].map((img)=>img['image'] )),
        favorite = json['favorite'],
        product_related = List<Product>.from(json['product_related'].map((model)=> Product.fromJson(model))),
        description = json['description'],
         features = json['features']!=null?List<Feature>.from(json['features'].map((model)=> Feature.fromJson(model))):null,
          price = json['price']

      
        ;

  Map<String, dynamic> toJson() => {
        'id' : id,
        'name' : name,
        'images' : images,
        'favorite' : favorite,
        'product_related' : product_related,
        'description' : description,
         'features' : features,
          'price' : price
      };
}
