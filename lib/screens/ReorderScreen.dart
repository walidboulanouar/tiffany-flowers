import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import '../models/Order.dart';
import '../models/OrderItem.dart';
import '../providers/LoadingProvider.dart';
import '../providers/UserProvider.dart';
import '../services/Services.dart';
import '../translations/locale_keys.g.dart';
import '../widgets/OrderAppBar.dart';
import '../widgets/OrderDetailCard.dart';
import 'PaymentScreen.dart';

class ReorderScreen extends StatefulWidget {
  Order order;
  ReorderScreen({required this.order, Key? key}) : super(key: key);

  @override
  State<ReorderScreen> createState() => _ReorderScreenState();
}

class _ReorderScreenState extends State<ReorderScreen> {
  List<OrderItem> orderItems = [];
  // String? orderImg;
  @override
  void initState() {
    super.initState();

    getOrderItems(widget.order.id).then((data) {
      if (mounted) {
        setState(() {
          orderItems = data as List<OrderItem>;
        });
      }
    });
  }

  Widget build(BuildContext context) {
     UserProvider userProvider = Provider.of<UserProvider>(context);
     LoadingProvider loadingProvider = Provider.of<LoadingProvider>(context);
   
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: Container(
          
          height: 15.w,
          width: 15.w,
          child: FloatingActionButton(
            backgroundColor: Color(0xff73BFBD),
            onPressed: () async {
    
               showGeneralDialog(
                                context: context,
                                barrierDismissible: false,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return SafeArea(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height,
                                      padding: EdgeInsets.all(20),
                                      color: Colors.transparent,
                                      child: Center(
                                        child: SpinKitWave(
                                          // duration: const Duration(seconds: 10),
                                          color: Color(0xff73BFBD),
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
    
                              
                              Response response = await addOrder(
                                userProvider.user!,
                                widget.order.subTotal.toInt(),
                                widget.order.itemCount,
                                widget.order.shipping.toInt(),
                                widget.order.receiverAddr,
                                userProvider.user!.phone,
                                widget.order.receiverPhoneNumber,
                                widget.order.addtAddr,
                                widget.order.selectedMsg,
                                widget.order.phrase,
                                orderItems,
                                widget.order.city,
                                loadingProvider,
                              );
    
                              if (response.statusCode == 200) {
                                final jsonData = jsonDecode(response.data);
                                Navigator.of(context, rootNavigator: true)
                                        .canPop()
                                    ? Navigator.of(context, rootNavigator: true)
                                        .pop()
                                    : null;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentScreen(
                                        subTotal: widget.order.subTotal.toInt(),
                                        screen: orderScreen,
                                            shpping: widget.order.shipping.toInt(),
                                            url: jsonData['result']
                                                ['redirectUrl'],
                                          )),
                                );
    
                               
    
                              } else {
                                print(response);
                                Navigator.of(context, rootNavigator: true)
                                        .canPop()
                                    ? Navigator.of(context, rootNavigator: true)
                                        .pop()
                                    : null;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Color(0xffD8AA6B),
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                        LocaleKeys.Somthingwrong.tr(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                
                              }
                            
            },
            child: Padding(
             padding: EdgeInsets.all(2.sp),
              child: Text(
               LocaleKeys.Re_Order.tr(),
                style: TextStyle(fontSize: 6.sp),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OrderAppBar(
              myfc: () {
                Navigator.of(context).pop();
              },
              title: LocaleKeys.Re_Order.tr(),
            ),
            SizedBox(
              height: 2.h,
            ),
            Flexible(
              // height: 70.h,
              child: ListView(padding: EdgeInsets.only(bottom: 4.h), children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                     LocaleKeys.PaymentMethod.tr(),
                      style: TextStyle(
                        color: Color(0xffD8AA6B),
                        fontSize: 9.sp,
                      ),
                    ),
                    SizedBox(
                      width: 32.w,
                    ),
                    Container(
                      width: 20.w,
                      margin: EdgeInsets.only(right: 6.sp),
                      child: Row(
                        children: [
                          Container(
                              height: 2.5.h,
                              child: Image.asset("assets/images/visa.png")),
                          SizedBox(
                            width: 3.w,
                          ),
                          Container(
                              height: 2.5.h,
                              child:
                                  Image.asset("assets/images/mastercard@2x.png")),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                ItemName(LocaleKeys.ReceiverAddress.tr(),),
                ItemContent(widget.order.receiverAddr),
                SizedBox(
                  height: 4.h,
                ),
                ItemName(LocaleKeys.AdditionalAddressInfo.tr(),),
                ItemContent(widget.order.addtAddr),
                SizedBox(
                  height: 4.h,
                ),
                ItemName(LocaleKeys.ReceiverPhoneNumber.tr(),),
                ItemContent(widget.order.receiverPhoneNumber),
                SizedBox(
                  height: 4.h,
                ),
                ItemName(LocaleKeys.SelectedMessage.tr(),),
                ItemContent(widget.order.selectedMsg),
                SizedBox(
                  height: 4.h,
                ),
                ItemName(LocaleKeys.PhraseOnTheFlowerBouquet.tr(),),
                ItemContent(widget.order.phrase),
                SizedBox(
                  height: 5.h,
                ),
                Divider(
                  color: Colors.black,
                  indent: 25.w,
                  endIndent: 25.w,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Center(
                    child: Text(
                  LocaleKeys.ItemsDetails.tr(),
                  style: TextStyle(
                    color: Color(0xff73BFBD),
                    fontSize: 13.sp,
                  ),
                )),
                SizedBox(
                  height: 4.h,
                ),
                ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemCount: orderItems.length,
                    itemBuilder: (_, index) {
                      return OrderDetailCard(
                        image: orderItems[index].image,
                        price: orderItems[index].price,
                        quantity: orderItems[index].count,
                        name: orderItems[index].name,
                      );
                    }),
                SizedBox(
                  height: 2.h,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  String content;
  ItemContent(
    this.content, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromARGB(255, 249, 249, 249),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.sp),
        height: 5.h,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "  " + content,
              style: TextStyle(color: Color(0xff73BFBD)),
            )));
  }
}

class ItemName extends StatelessWidget {
  String name;
  ItemName(
    this.name, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 5.w,
        ),
        Text(
          name,
          style: TextStyle(
            color: Color(0xffD8AA6B),
            fontSize: 9.sp,
          ),
        ),
      ],
    );
  }
}
