import 'package:ecomerceapp/screens/Chekout.dart';
import 'package:ecomerceapp/widgets/CartAppBar.dart';
import 'package:ecomerceapp/widgets/CartCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/IndexProvider.dart';
import '../widgets/OrderToggle.dart';
import '../widgets/TotalCard.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    return Scaffold(
      floatingActionButton: Container(
        height: 6.h,
        width: 6.h,
        child: FloatingActionButton(
          heroTag: Text("btn5"),
          backgroundColor: Colors.green,
          onPressed: () {},
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
            child: ListView(padding: EdgeInsets.all(0), children: [
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  itemCount: 2,
                  itemBuilder: (_, index) {
                    return CartCard();
                  }),
              TotalCard(),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 14.sp),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Checkout()),
                        );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
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
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
