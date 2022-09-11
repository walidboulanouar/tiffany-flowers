import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecomerceapp/providers/CartProvider.dart';
import 'package:ecomerceapp/screens/Checkout.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/widgets/CartAppBar.dart';
import 'package:ecomerceapp/widgets/CartCard.dart';
import 'package:ecomerceapp/widgets/WebViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/CartItem.dart';
import '../providers/IndexProvider.dart';
import '../providers/UserProvider.dart';
import '../services/Services.dart';
import '../services/SqlService.dart';
import '../widgets/OrderToggle.dart';
import '../widgets/TotalCard.dart';
import 'LoginScreen.dart';
import 'RegistrationScreen.dart';
import 'VerificationScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var sqlService = SqlService();
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    sqlService.getItems(cartProvider);
    sqlService.getUser(userProvider);
  }

  Widget build(BuildContext context) {
    var sqlService = SqlService();
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    for(CartItem item in cartProvider.items){
      print(item.color);
      print(item.count);
      print(item.size);
     print(item.sizePrice); 
    }
    
    
    return Scaffold(
      floatingActionButton: Container(
        height: 6.h,
        width: 6.h,
        child: FloatingActionButton(
          heroTag: Text("btn5"),
          backgroundColor: Colors.green,
          onPressed: () {
            openWhatsap();
          },
          child: Icon(
            Icons.whatsapp,
            size: 25.sp,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CartAppBar(
            myfc: () {
              indexProvider.setCurrentIndex(2);
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          Flexible(
            // height: 70.h,
            child: cartProvider.count > 0?ListView(padding: EdgeInsets.all(0), children: [
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  itemCount: cartProvider.count,
                  itemBuilder: (_, index) {
                    return Dismissible(
                        onDismissed: (_) {
                          sqlService.deleteItem(
                              cartProvider.items[index].productId,
                              cartProvider);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text("removed from Cart")));
                        },
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Color(0xffF37878),
                          child: Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Color(0xffDB6565),
                                  child: Icon(
                                    Icons.delete_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                              ],
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        key:
                            Key(cartProvider.items[index].productId.toString()),
                        child: CartCard(
                          item: cartProvider.items[index],
                        ));
                  }),
              cartProvider.count > 0 ? TotalCard() : Container(),
              cartProvider.count > 0
                  ? Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 14.sp),
                      child: TextButton(
                        onPressed: () {
                          if (cartProvider.Total() < 250) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content:
                                    Text("The Total should be more than 250"),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }else{
                          //  Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) => WebViewExample(url: 'https://pay.test.paymennt.com/checkout/0a5728c747bd7074414fdba50569cf867c1815d586f02a80',)),
                          //           );
                          userProvider.user == null
                              ? AwesomeDialog(
                                titleTextStyle: TextStyle(color: Color(0xff73BFBD),),
                                descTextStyle: TextStyle(color: Color(0xffD8AA6B),),
                                btnOkColor:Color(0xff73BFBD),
                                btnCancelColor: Color(0xffD8AA6B),
                                  btnOkText: "Sign In",
                                  context: context,
                                  dialogType: DialogType.WARNING,
                                  animType: AnimType.RIGHSLIDE,
                                  title: 'Sign In Required',
                                  desc: 'This Action Require Sign in ',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (_) => RegistrationScreen(cartScreen),
                                ),
                              );
                                    
                                  },
                                ).show()
                              : (Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Checkout()),
                                ));}
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.sp),
                          child: Text(
                            "Checkout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff73BFBD)),
                        ),
                      ),
                    )
                  : Container(),
            ]):Center(child: Text("Your Cart Is Empty Start Adding to The Cart"),),
          ),
        ],
      ),
    );
  }
}
