import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:ecomerceapp/screens/CartScreen.dart';
import 'package:ecomerceapp/screens/OrderDetails.dart';
import 'package:ecomerceapp/widgets/OrderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:sizer/sizer.dart';

class OrderToggle extends StatefulWidget {
  const OrderToggle({Key? key}) : super(key: key);

  @override
  State<OrderToggle> createState() => _OrderToggleState();
}

class _OrderToggleState extends State<OrderToggle> {
  int _tabTextIndexSelected = 0;
  List<Color> _Colors=[Color(0xff73BFBD),Color(0xff656565),Color(0xffEC7979)];
  List<String> _listTextTabToggle = ["Completed", "Pennding", "Canceled"];
  Color _selectedBgColor = Color(0xff73BFBD);
  bool _reOrder=true;
  void _changeBgColor(int index) {
    switch (index) {
      case 1:
        setState(() {
          _selectedBgColor = Color(0xff656565);
          _reOrder=false;
        });
        break;
      case 2:
        setState(() {
          _selectedBgColor = Color(0xffEC7979);
           _reOrder=false;
        });
        break;
      default:
        setState(() {
          _selectedBgColor = Color(0xff73BFBD);
           _reOrder=true;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
        Container(
      // margin: EdgeInsets.only(top: 15.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: FlutterToggleTab(
              isShadowEnable: false,

              unSelectedBackgroundColors: [Colors.white],

              // width in percent

              width: 25.w,

              borderRadius: 100,

              height: 5.h,

              selectedIndex: _tabTextIndexSelected,

              selectedBackgroundColors: [_selectedBgColor],

              selectedTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),

              unSelectedTextStyle: TextStyle(
                  color: Color(0xffB9B9B9),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),

              labels: _listTextTabToggle,

              selectedLabelIndex: (index) {
                _changeBgColor(index);

                setState(() {
                  _tabTextIndexSelected = index;
                });
              },

              isScroll: false,
            ),
          ),
          Container(
            height: 70.h,
            child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 7,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (_) => OrderDetails(),
            ),
          );
                      //  Navigator.p(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         (OrderDetails()),
                      //   ),
                      // );
                    },
                    child: OrderCard(reorder: _reOrder,orderColor: _Colors[_tabTextIndexSelected],));
                }),
          ),
        ],
      ),
    );
  }
}
