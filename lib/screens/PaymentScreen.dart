import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../widgets/CartCard.dart';
import '../widgets/OrderAppBar.dart';
import '../widgets/PaymentCard.dart';
import '../widgets/PaymentTotalCard.dart';
import '../widgets/TotalCard.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

enum PaymentMethod { CashOnDelivery, CreditCard }

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? _character = null;

  @override
  Widget build(BuildContext context) {
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
                    toggleable: true,
                    activeColor: Color(0xff73BFBD),
                    title: Text('Cash On Delivery',
                        style: TextStyle(
                          color: Color(0xff73BFBD),
                          fontSize: 9.sp,
                        )),
                    value: PaymentMethod.CashOnDelivery,
                    groupValue: _character,
                    onChanged: (PaymentMethod? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile<PaymentMethod>(
                     toggleable: true,
                    activeColor: Color(0xff73BFBD),
                    secondary: Container(
                      width: 26.w,
                      margin: EdgeInsets.only(right: 6.sp),
                      child: Row(
                        children: [
                          Container(
                              height: 2.5.h,
                              child: Image.asset("assets/images/visacard.png")),
                          SizedBox(
                            width: 3.w,
                          ),
                          Container(
                              height: 2.5.h,
                              child: Image.asset("assets/images/visacard.png")),
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
                        _character = value;
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
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return PaymentCard();
                    }),
                  ),
                  Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 5.sp, vertical:5.sp),
                    child: PaymentTotalCard(),
                  ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 14.sp),
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>  Checkout()),
                    //     );
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
