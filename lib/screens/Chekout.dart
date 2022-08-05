import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecomerceapp/widgets/TextTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';

import '../widgets/CheckoutAppBar.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            CheckoutAppBar(),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Reciever Address",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffD8AA6B),
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 0.12.h,
            ),
            TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xffF9F9F9),
                    filled: true)),
            Text(
              "Additional Address Info",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffD8AA6B),
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 0.2.h,
            ),
            Text(
              "Receiver Phone Number",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffD8AA6B),
                fontSize: 25,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xffF9F9F9),
                filled: true,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "your phone number",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffD8AA6B),
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 0.12.h,
            ),
            TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xffF9F9F9),
                    filled: true)),
            Text(
              "Select Your message",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffD8AA6B),
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 0.2.h,
            ),
            Text(
              "Put A Phrase On the Flower Bouquet",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffD8AA6B),
                fontSize: 25,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Color(0xffF9F9F9),
                filled: true,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.sp),
                child: Text("Checkout", style: TextStyle(color: Colors.white)),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff73BFBD)),
              ),
            ),
            Text('English',
                style: TextStyle(fontSize: 9.sp, color: Color(0xff73BFBD))),
            SizedBox(
              height: 0.2.h,
            ),
            Text(
              "About Us",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffD8AA6B),
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
          ]),
    );
  }
}
