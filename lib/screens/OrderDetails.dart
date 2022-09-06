import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../models/Order.dart';
import '../models/OrderItem.dart';
import '../services/Services.dart';
import '../widgets/OrderAppBar.dart';
import '../widgets/OrderDetailCard.dart';

class OrderDetails extends StatefulWidget {
  Order order;
   OrderDetails({
    required this.order,
    Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
   List<OrderItem> orderItems = [];
  // String? orderImg;
  @override
  void initState() {
    super.initState();
    // OrderProvider orderProvider = Provider.of<OrderProvider>(context, listen: false);
    getOrderItems(widget.order.id).then((data) {
      // List<OrderItem> data1=data as List<OrderItem>;
      // getProductByID(data1[0].productId).then((dd) {
      //   orderProvider.addToImages(dd);
      //   if(mounted){
      //      setState((){
      //  orderImg=dd ;
      // }
      // );
      //   }
      // });
      if(mounted){
        setState(() {
        orderItems = data as List<OrderItem>;
      });
      }
    });
  }
  Widget build(BuildContext context) {
    print(widget.order.endDate);
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
                    width: 5.w,
                  ),
                  Text(
                    "Order ID",
                    style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  Text(
                    widget.order.orderId,
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
                    width: 5.w,
                  ),
                  Text(
                    "Order Start Date",
                    style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    widget.order.startDate,
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
                    width: 5.w,
                  ),
                  Text(
                    "Order End Date",
                    style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Text(
                    widget.order.endDate!=null?widget.order.endDate.toString():"",
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
                    width: 5.w,
                  ),
                  Text(
                    "Order Status",
                    style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 9.sp,
                    ),
                  ),
                  SizedBox(
                    width: 38.w,
                  ),
                  Text(
                    widget.order.status,
                    style: TextStyle(
                      color: Color(0xff73BFBD),
                      fontSize: 10.sp,
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
                    width: 5.w,
                  ),
                  Text(
                    "Payment Method",
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
              ItemName("Receiver Address"),
              ItemContent(widget.order.receiverAddr),
              SizedBox(
                height: 4.h,
              ),
              ItemName(widget.order.addtAddr),
              ItemContent("test"),
              SizedBox(
                height: 4.h,
              ),
              ItemName("Receiver Phone Number"),
              ItemContent(widget.order.receiverPhoneNumber),
              SizedBox(
                height: 4.h,
              ),
              ItemName("Selected Message"),
              ItemContent(widget.order.selectedMsg),
              SizedBox(
                height: 4.h,
              ),
              ItemName("Phrase On The Flower Bouquet"),
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
                  itemCount: orderItems.length,
                  itemBuilder: (_, index) {
                    return OrderDetailCard(
                      image: orderItems[index].itemImg,
                      price: orderItems[index].price,
                      quantity: orderItems[index].quantity,
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
    );
  }
}

class ItemContent extends StatelessWidget {
  String content;
   ItemContent(
    this.content,
    {
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
            child: Text("  "+content,style: TextStyle(color:Color(0xff73BFBD) ),)));
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
