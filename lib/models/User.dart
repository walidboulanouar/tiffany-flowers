import 'package:flutter/material.dart';

import 'Product.dart';

class User {
   int id;
    String phone;
    String? email;
    String? firstName;
    String? lastName;
 

  User({required this.id, required this.phone, this.email, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        phone = json['phone_number'],
        email = json['email'],
        firstName = json['first_name'],
        lastName = json['last_name']
      
        ;

  Map<String, dynamic> toJson() => {
        'id': id,
        'phone_number': phone,
       'email':email,
       'firstName':firstName,
       'lastName':lastName
      };
      
}
