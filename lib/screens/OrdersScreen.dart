import 'package:ecomerceapp/widgets/OrderAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/IndexProvider.dart';
import '../widgets/OrderToggle.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OrderAppBar(
              myfc: () {
               indexProvider.setCurrentIndex(2);
              },
              title: "My Orders",),
            SizedBox(
              height: 2.h,
            ),
            OrderToggle(),
          ],
        ),
      ),
    );
  }
}
