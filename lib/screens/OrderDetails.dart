import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../widgets/OrderAppBar.dart';
import '../widgets/OrderDetailCard.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OrderAppBar(
            myfc: () {
              Navigator.of(context).pop();
            },
            title: "Order Details",
          ),
          SizedBox(
            height: 2.h,
          ),
          Flexible(
            // height: 70.h,
            child: ListView(padding: EdgeInsets.all(0), children: [
                 SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "OrderId",
                    style: TextStyle(
                      color: Color(0xff656565),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  Text(
                    "DFTHG-GHJL",
                    style: TextStyle(
                      color: Color(0xff505050),
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "Quantity",
                    style: TextStyle(
                      color: Color(0xff656565),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 46.w,
                  ),
                  Text(
                    "6 Items",
                    style: TextStyle(
                      color: Color(0xffB9B9B9),
                      fontSize: 9.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "Total Value",
                    style: TextStyle(
                      color: Color(0xff656565),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 39.w,
                  ),
                  Text(
                    "250 AED",
                    style: TextStyle(
                      color: Color(0xffB9B9B9),
                      fontSize: 9.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "Order Start Date",
                    style: TextStyle(
                      color: Color(0xff656565),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 17.w,
                  ),
                  Text(
                    "2/5/2021 - 2:05PM",
                    style: TextStyle(
                      color: Color(0xffB9B9B9),
                      fontSize: 9.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "Order End Date",
                    style: TextStyle(
                      color: Color(0xff656565),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Text(
                    "2/5/2021 - 4:05PM",
                    style: TextStyle(
                      color: Color(0xffB9B9B9),
                      fontSize: 9.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "Order Status",
                    style: TextStyle(
                      color: Color(0xff656565),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Text(
                    "Completed",
                    style: TextStyle(
                      color: Color(0xff73BFBD),
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ),
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
                "Items Details",
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
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return OrderDetailCard(
                      image: 'assets/images/bouket3.jfif',
                    );
                  }),
                   SizedBox(
                height: 2.h,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
