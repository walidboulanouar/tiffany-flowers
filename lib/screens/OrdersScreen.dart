import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecomerceapp/providers/UserProvider.dart';
import 'package:ecomerceapp/services/Services.dart';
import 'package:ecomerceapp/widgets/OrderAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../models/Order.dart';
import '../providers/IndexProvider.dart';
import '../providers/OrderProvider.dart';
import '../services/SqlService.dart';
import '../widgets/OrderToggle.dart';
import 'HomeScreen.dart';

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
      // if(mounted){
        //  Future.delayed(Duration.zero,(){
        print("zzz");
        var sqlService = SqlService();
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      sqlService.getUser(userProvider).then((user) {
        // print(userProvider.user!.id);
        OrderProvider orderProvider =
            Provider.of<OrderProvider>(context, listen: false);
        //  Future.delayed(Duration.zero,(){
        //  print(userProvider.user);
        //  if(widget.id!=-1){
        //   print(widget.id!);
        if(userProvider.user!=null){
getOrders(userProvider.user!.id, orderProvider);
        }else{
          print("tsss");
        }
        
      });
      // print(userProvider.user!.id);
      // OrderProvider orderProvider =
      // Provider.of<OrderProvider>(context, listen: false);
      //  Future.delayed(Duration.zero,(){
      //  print(userProvider.user);
      //  if(widget.id!=-1){
      //   print(widget.id!);
      // getOrders(userProvider.user!.id, orderProvider);
      // }else{
      //   print("l9lawiiii");
      // }
      // }
    // });
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
     setState(() {
        completed = orderProvider.orders
          .where((order) => order.status == "completed")
          .toList();
     },);
     setState(() {
        pending = orderProvider.orders
          .where((order) => order.status == "pending")
          .toList();
     },);
     setState(() {
        canceled = orderProvider.orders
          .where((order) => order.status == "canceled")
          .toList();
     },);

      
      

      // print(pending[0]);

    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OrderAppBar(
            myfc: () {
              indexProvider.setCurrentIndex(2);
            },
            title: "My Orders",
          ),
          // SizedBox(
          //   height: 2.h,
          // ),
          
          completed.length>0||pending.length>0||canceled.length>0?
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                height: 100.h,
                child:OrderToggle(
                      completed: completed, canceled: canceled, pending: pending)),
            ),
          )
          :Container(),
        ],
      ),
    );
  }
}
