
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderCard extends StatelessWidget {
  Color orderColor;
   OrderCard({required this.orderColor,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      margin:EdgeInsets.all(10.sp),
      color:orderColor,
      child: Row(children: [
      Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: 12.h,
                  width:12.h,
                  child: Image.asset(
                   "assets/images/bouket.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // elevation: 1,
                margin: EdgeInsets.only(left: 8.sp,right: 8.sp,bottom: 8.sp,top:8.sp),
              ),
        
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
        Text("DFTHG-GHJL",style:TextStyle(fontSize: 10.sp,color: Colors.white)),
        SizedBox(height:2.h),
        Text("Quantity:6 Items",style:TextStyle(fontSize: 9.sp,color: Color.fromARGB(133, 255, 255, 255))),

        SizedBox(height:2.h),
        Text("Value:250 AED",style:TextStyle(fontSize: 9.sp,color: Color.fromARGB(133, 255, 255, 255))),
      ]),
      SizedBox(width: 20.w,),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
        SizedBox.fromSize(
  size: Size(6.h, 8.h), // button width and height
  child: ClipOval(
    child: Material(
      color: Colors.transparent, // button color
      child: InkWell(
        // splashColor: Colors.green, // splash color
        onTap: () {}, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icon(Icons.keyboard_double_arrow_down,color: Colors.white,),// icon
            ImageIcon(
                      AssetImage("assets/images/reorder.png"),
                      color: Colors.white,
                    ),
            Text("Reorder",style:TextStyle(fontSize: 7.sp,color: Color.fromARGB(133, 255, 255, 255))), // text
          ],
        ),
      ),
    ),
  ),
),
        SizedBox(height:5.h),
        Container(
          margin: EdgeInsets.only(bottom: 5.sp),
          child: Text("05:19 PM",style:TextStyle(fontSize: 7.sp,color: Color.fromARGB(133, 255, 255, 255)))),
      ]),
    ],),);
    
  }
}