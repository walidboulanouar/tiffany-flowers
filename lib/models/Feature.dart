import 'package:ecomerceapp/models/FeatureValue.dart';
import 'package:flutter/material.dart';

class Feature {
  final int id;
   String name;
   List<FeatureValue> values;



  

  Feature({required this.values, required this.name, required this.id}) {}

  Feature.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        values = List<FeatureValue>.from(json['values'].map((model)=> FeatureValue.fromJson(model)));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'values': values,
      };
      
}
