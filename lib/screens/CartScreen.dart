import 'package:ecomerceapp/widgets/CartAppBar.dart';
import 'package:ecomerceapp/widgets/CartCard.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/OrderToggle.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CartAppBar(),
          SizedBox(
            height: 2.h,
          ),
          Container(
            height: 70.h,
            child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 3,
                itemBuilder: (_, index) {
                  return CartCard();
                }),
          ),
        ],
      ),
    );
  }
}