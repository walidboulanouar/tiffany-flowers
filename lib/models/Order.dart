import 'package:flutter/material.dart';

import 'Category.dart';
import 'Feature.dart';

class Order {
  int id;
  String orderId;
  int userId;
  String status;
  double subTotal;
  double shipping;
  String startDate;
  String? endDate;
  int itemCount;
  String receiverAddr;
  String receiverPhoneNumber;
  String addtAddr;
  String selectedMsg;
  String phrase;
  String orderImg;
  Order({

    required this.id,
    required this.orderId,
    required this.userId,
    required this.orderImg,
    required this.status,
    required this.subTotal,
    required this.addtAddr,
    required this.endDate,
    required this.itemCount,
    required this.phrase,
    required this.receiverAddr,
    required this.receiverPhoneNumber,
    required this.selectedMsg,
    required this.shipping,
    required this.startDate,
    
  });

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        orderId = json['order_id']??"test",
        orderImg=json['order_img'],
        userId = json['user_id'],
        subTotal = double.parse(json['sub_total']),
        status = json['status'],
        startDate = json['start_date'],
        endDate = json['end_date'],
        shipping = double.parse(json['shipping']),
        selectedMsg = json['selected_msg'],
        receiverPhoneNumber = json['receiver_phone_number'],
        receiverAddr = json['receiver_addr']??"hhh",
        phrase = json['phrase'],
        itemCount = json['item_count'],
        addtAddr = json['addt_addr'];
        
        

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
