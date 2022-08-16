import 'package:flutter/material.dart';

class FeatureValue {
  final int id;
  String value;
  String name;
  int price;



  FeatureValue({required this.price,required this.value, required this.name, required this.id}) {}

  FeatureValue.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        value = json['value'],
        price = json['price']
        ;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'value': value,
        'price': price,
      };
      
}
