import 'package:ecomerceapp/widgets/OrderAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../widgets/OrderToggle.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OrderAppBar(),
          SizedBox(
            height: 2.h,
          ),
          OrderToggle(),
        ],
      ),
    );
  }
}
