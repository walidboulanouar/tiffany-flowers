import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:ecomerceapp/providers/UserProvider.dart';
import 'package:ecomerceapp/services/Services.dart';
import 'package:ecomerceapp/translations/locale_keys.g.dart';
import 'package:ecomerceapp/widgets/OrderAppBar.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import '../models/Order.dart';
import '../providers/IndexProvider.dart';
import '../providers/OrderProvider.dart';
import '../services/SqlService.dart';
import '../widgets/OrderToggle.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var sqlService = SqlService();
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      sqlService.getUser(userProvider).then((user) {
        OrderProvider orderProvider =
            Provider.of<OrderProvider>(context, listen: false);

        if (userProvider.user != null) {
          getOrders(userProvider.user!.id, orderProvider);
        } else {
          print("tsss");
        }
      });
    });
  }

  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);

    print(userProvider.user);
    print("orderProvider.orders");
    print(orderProvider.orders);
    List<Order> completed = [];
    List<Order> pending = [];
    List<Order> canceled = [];
    if (orderProvider.orders != []) {
      setState(
        () {
          completed = orderProvider.orders
              .where((order) => order.status == "completed")
              .toList();
        },
      );
      setState(
        () {
          pending = orderProvider.orders
              .where((order) => order.status == "pending")
              .toList();
        },
      );
      setState(
        () {
          canceled = orderProvider.orders
              .where((order) => order.status == "canceled")
              .toList();
        },
      );

      // print(pending[0]);

    }
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OrderAppBar(
              myfc: () {
                indexProvider.setCurrentIndex(2);
              },
              title: LocaleKeys.MyOrders.tr(),
            ),
            completed.length > 0 || pending.length > 0 || canceled.length > 0
                ? Flexible(
                    child: SingleChildScrollView(
                      child: Container(
                          height: 100.h,
                          child: OrderToggle(
                              completed: completed,
                              canceled: canceled,
                              pending: pending)),
                    ),
                  )
                : Center(
                    child: Text(
                      LocaleKeys.NoOrderYet.tr(),
                      style: TextStyle(color: Color(0xffD8AA6B)),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
