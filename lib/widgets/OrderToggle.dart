import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecomerceapp/screens/CartScreen.dart';
import 'package:ecomerceapp/screens/OrderDetails.dart';
import 'package:ecomerceapp/widgets/OrderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:restart_app/restart_app.dart';
import 'package:sizer/sizer.dart';

import '../models/Order.dart';
import '../screens/HomeScreen.dart';
import '../translations/locale_keys.g.dart';

class OrderToggle extends StatefulWidget {
  List<Order> completed;
  List<Order> pending;
  List<Order> canceled;

  OrderToggle(
      {Key? key,
      required this.completed,
      required this.pending,
      required this.canceled})
      : super(key: key);

  @override
  State<OrderToggle> createState() => _OrderToggleState();
}

class _OrderToggleState extends State<OrderToggle> {
  int _tabTextIndexSelected = 0;
  List<Color> _Colors = [
    Color(0xff73BFBD),
    Color(0xffD8AA6B),
    Color(0xffA7A7A7)
  ];
  List<String> _listTextTabToggle = [LocaleKeys.Completed.tr(), LocaleKeys.Pennding.tr(), LocaleKeys.Canceled.tr()];
  Color _selectedBgColor = Color(0xff73BFBD);
  bool _reOrder = true;
  void _changeBgColor(int index) {
    switch (index) {
      case 1:
        setState(() {
          _selectedBgColor = Color(0xffD8AA6B);
          _reOrder = false;
        });
        break;
      case 2:
        setState(() {
          _selectedBgColor = Color(0xffA7A7A7);
          _reOrder = false;
        });
        break;
      default:
        setState(() {
          _selectedBgColor = Color(0xff73BFBD);
          _reOrder = true;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("widget.completed");
    print(widget.completed);
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

              width: 100.w>600?10.w:25.w,
              // width: 100.w/4,

              borderRadius: 100,

              height: 5.h,

              selectedIndex: _tabTextIndexSelected,

              selectedBackgroundColors: [_selectedBgColor],

              selectedTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w700),

              unSelectedTextStyle: TextStyle(
                  color: Color(0xffB9B9B9),
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500),

              labels: _listTextTabToggle,

              selectedLabelIndex: (index) {
               
                _changeBgColor(index);
                
                setState(() {
                  _tabTextIndexSelected = index;
                });
                
                //  orderScreen.currentState!.initState();
              },

              isScroll: false,
            ),
          ),
          Container(
              height: 70.h,
              child: (() {
                if (_tabTextIndexSelected == 0) {
                 return ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: widget.completed.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                            onTap: () {
                              
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (_) => OrderDetails(order: widget.completed[index],),
                                ),
                              );
                              
                            },
                            child:
                            // Text(widget.completed[index].orderId)
                             OrderCard(
                              
                              order: widget.completed[index],
                              reorder: _reOrder,
                              orderColor: _Colors[_tabTextIndexSelected],
                            )
                            );
                      });
                } else if(_tabTextIndexSelected==1) {
                  return ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: widget.pending.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (_) => OrderDetails(order: widget.pending[index],),
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
                            child: 
                           
                            OrderCard(
                              
                              order: widget.pending[index],
                              reorder: _reOrder,
                              orderColor: _Colors[_tabTextIndexSelected],
                            )
                            );
                      });
                } else if(_tabTextIndexSelected==2) {
                 return ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: widget.canceled.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (_) => OrderDetails(order: widget.canceled[index],),
                                ),
                              );
                             
                            },
                            child:
                            
                            OrderCard(
                              
                              order: widget.canceled[index],
                              reorder: _reOrder,
                              orderColor: _Colors[_tabTextIndexSelected],
                            )
                            );
                      });
                }
              }())),
        ],
      ),
    );
  }
}
