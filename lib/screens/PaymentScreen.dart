import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecomerceapp/widgets/WebViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import '../providers/CartProvider.dart';
import '../providers/UserProvider.dart';
import '../services/SqlService.dart';
import '../widgets/CartCard.dart';
import '../widgets/OrderAppBar.dart';
import '../widgets/PaymentCard.dart';
import '../widgets/PaymentTotalCard.dart';
import '../widgets/TotalCard.dart';

class PaymentScreen extends StatefulWidget {
  String url;
  int shpping;
  int subTotal;
  GlobalKey<NavigatorState> screen;
   PaymentScreen({Key? key, required this.subTotal,required this.url,required this.shpping,required this.screen}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

enum PaymentMethod { CreditCard }

class _PaymentScreenState extends State<PaymentScreen> {
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
  PaymentMethod? _character = PaymentMethod.CreditCard;

  @override
  Widget build(BuildContext context) {
     var sqlService = SqlService();
    
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          OrderAppBar(
            myfc: () {
              Navigator.of(context).pop();
            },
            title: "Payment Method",
          ),
          Flexible(
            child: ListView(

                // Remove padding
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.sp),
                    child: Text("Payment Method",
                        style: TextStyle(
                          color: Color(0xffD8AA6B),
                          fontSize: 10.sp,
                        )),
                  ),
                
                  RadioListTile<PaymentMethod>(
                  
                    activeColor: Color(0xff73BFBD),
                    secondary: Container(
                      width: 26.w,
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
                              child: Image.asset("assets/images/mastercard@2x.png")),
                        ],
                      ),
                    ),
                    title: Text('Credit Card',
                        style: TextStyle(
                          color: Color(0xff73BFBD),
                          fontSize: 9.sp,
                        )),
                    value: PaymentMethod.CreditCard,
                    groupValue: _character,
                    onChanged: (PaymentMethod? value) {
                      setState(() {
                        _character = value??PaymentMethod.CreditCard;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.sp),
                    child: Text("My order",
                        style: TextStyle(
                          color: Color(0xffD8AA6B),
                          fontSize: 10.sp,
                        )),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp, vertical:5.sp),
                    child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemCount: cartProvider.count,
                    itemBuilder: (_, index) {
                      return PaymentCard(
                        image: cartProvider.items[index].image,
                        name: cartProvider.items[index].name,
                        price: cartProvider.items[index].price,
                        quantity: cartProvider.items[index].count,
                        size: cartProvider.items[index].size,
                        
                      );
                    }),
                  ),
                  Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 5.sp, vertical:5.sp),
                    child: PaymentTotalCard(
                      shipping_cost: widget.shpping,
                      subTotal: widget.subTotal,
                      total: (widget.subTotal+widget.shpping+widget.subTotal*0.05).toInt(),
                    

                    ),
                  ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 14.sp),
                child: TextButton(
                  onPressed: () {
                     sqlService.deleteCartItems(cartProvider);
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  WebViewExample(url: widget.url,screen: widget.screen,)),
                        );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff73BFBD)),
                  ),
                ),
              ),
                ]),
          ),
        ],
      ),
    );
  }
}
