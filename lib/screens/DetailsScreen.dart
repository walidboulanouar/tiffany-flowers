import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecomerceapp/screens/CategoryDetailsScreen.dart';
import 'package:ecomerceapp/widgets/CategoryAppBar.dart';
import 'package:ecomerceapp/widgets/DetailsAppBar.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:ecomerceapp/widgets/NoLoppingSlider.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../models/Category.dart';
import '../widgets/ScrollWidget.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<Map<String, dynamic>> items = [
    {"title": 'Small', "price": 55, "color": Color(0xff73BFBD)},
    {"title": 'Eduim', "price": 90, "color": Color(0xff73BFBD)},
    {"title": 'Large', "price": 100, "color": Color(0xffD8AA6B)}
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(
      List<Map<String, dynamic>> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item["title"],
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: RichText(
                text: TextSpan(
                    text: item["title"] + "(+",
                    style: TextStyle(
                        fontFamily: "Lucida Calligraphy",
                        fontSize: 10.sp,
                        color: item["color"]),
                    children: <TextSpan>[
                      TextSpan(
                        text: item["price"].toString(),
                        style: TextStyle(fontSize: 14.sp, color: item["color"]),
                      ),
                      TextSpan(
                        text: "AED)",
                        style: TextStyle(fontSize: 6.sp, color: item["color"]),
                      ),
                    ]),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<int> _getDividersIndexes() {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        height: 6.h,
        width: 6.h,
        child: FloatingActionButton(
          heroTag: Text("btn4"),
          backgroundColor: Colors.green,
          onPressed: () {},
          child: Icon(
            Icons.whatsapp,
            size: 25.sp,
          ),
        ),
      ),
      body: Material(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DetailsAppBar(
                myfc: (){
              Navigator.of(context).pop();
            },
                title: "Details",
              ),
              // SizedBox(
              //   height: 2.h,
              // ),
              Flexible(
                  child: ListView(
                      padding: EdgeInsets.only(top: 5.sp, bottom: 50.sp),
                      children: [
                    NoLoopingSlider(),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.sp),
                        child: Text(
                          "Vase Arrangement 0016",
                          style: TextStyle(
                              fontSize: 12.sp, color: Color(0xffD8AA6B)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 28.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.sp,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xff73BFBD)),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 17.sp,
                                )),
                            Center(
                              child: Container(
                                // margin: EdgeInsets.symmetric(horizontal: 3),
                                padding: EdgeInsets.only(
                                    bottom: 4.sp, left: 12.sp, right: 12.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color(0xff73BFBD)),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 17.sp,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 15.sp, left: 25.sp),
                        child: Text(
                          "Available Options",
                          style: TextStyle(
                              fontSize: 12.sp, color: Color(0xffD8AA6B)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(top: 15.sp, left: 25.sp),
                          child: Row(
                            children: [
                              Text(
                                "Color:",
                                style: TextStyle(
                                    fontSize: 12.sp, color: Color(0xff73BFBD)),
                              ),
                              SizedBox(
                                width: 50.sp,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10.sp),
                                child: Icon(
                                  Icons.local_florist,
                                  color: Color.fromARGB(255, 62, 45, 91),
                                  size: 17.sp,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10.sp),
                                child: Icon(
                                  Icons.local_florist,
                                  color: Color.fromARGB(255, 171, 201, 112),
                                  size: 17.sp,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff73BFBD),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                margin: EdgeInsets.only(right: 10.sp),
                                padding: EdgeInsets.all(2.sp),
                                child: Icon(
                                  Icons.local_florist,
                                  color: Color.fromARGB(255, 114, 64, 178),
                                  size: 17.sp,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff73BFBD),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                margin: EdgeInsets.only(right: 10.sp),
                                padding: EdgeInsets.all(2.sp),
                                child: Icon(
                                  Icons.local_florist,
                                  color: Color.fromARGB(255, 216, 114, 191),
                                  size: 17.sp,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10.sp),
                                child: Icon(
                                  Icons.local_florist,
                                  color: Color.fromARGB(255, 93, 32, 32),
                                  size: 17.sp,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffF9F9F9),
                      ),

                      padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                      margin: EdgeInsets.only(
                          left: 15.sp, top: 10.sp, right: 15.sp),
                      // width:100.w,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          // dropdownWidth:0.w-20.sp,
                          // barrierDismissible:false,
                          iconSize: 25.sp,
                          iconEnabledColor: Color(0xff73BFBD),

                          dropdownElevation: 0,

                          isExpanded: true,
                          hint: Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff73BFBD),
                            ),
                          ),
                          items: _addDividersAfterItems(items),
                          customItemsIndexes: _getDividersIndexes(),
                          customItemsHeight: 4,
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          buttonHeight: 40,
                          buttonWidth: 140,
                          itemHeight: 40,
                          itemPadding: EdgeInsets.symmetric(horizontal: 8.sp),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffF9F9F9),
                        ),
                        padding: EdgeInsets.only(
                            left: 14.sp, right: 10.sp, top: 6.sp, bottom: 6.sp),
                        margin: EdgeInsets.only(
                            left: 15.sp, top: 10.sp, right: 15.sp),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "About",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Color(0xffD8AA6B)),
                                )),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    style: TextStyle(
                                        height: 2,
                                        fontSize: 10.sp,
                                        color: Color.fromARGB(121, 80, 80, 80)),
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisi.")),
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10.0),
                            // color: Colors.white,
                            ),
                        padding: EdgeInsets.only(
                            left: 14.sp, right: 10.sp, top: 6.sp, bottom: 6.sp),
                        margin: EdgeInsets.only(
                            left: 15.sp, top: 10.sp, right: 15.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Price Unit",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xff73BFBD)),
                                )),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: RichText(
                                text: TextSpan(
                                    text: '20',
                                    style: TextStyle(
                                        fontFamily: "Lucida Calligraphy",
                                        fontSize: 16.sp,
                                        color: Color(0xffD8AA6B)),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'AED',
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            color: Color(0xffD8AA6B)),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xff73BFBD),
                        ),
                        padding: EdgeInsets.only(
                            left: 24.sp, right: 36.sp, top: 6.sp, bottom: 6.sp),
                        margin: EdgeInsets.only(
                          top: 10.sp,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Total Price ',
                                    style: TextStyle(
                                        fontFamily: "Lucida Calligraphy",
                                        fontSize: 12.sp,
                                        color: Colors.white),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '(Including Tax)',
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            color: Colors.white),
                                      ),
                                    ]),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: RichText(
                                text: TextSpan(
                                    text: '40.',
                                    style: TextStyle(
                                        fontFamily: "Lucida Calligraphy",
                                        fontSize: 17.sp,
                                        color: Colors.white),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'AED',
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            color: Colors.white),
                                      ),
                                    ]),
                              ),
                              
                            ),
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10.0),
                          color:Colors.white,
                        ),
                        padding: EdgeInsets.only(
                            left: 24.sp, right: 36.sp, top: 6.sp, bottom: 6.sp),
                        margin: EdgeInsets.only(
                          top: 0.sp,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        Size(14.w, 22.sp)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
                                    fixedSize: MaterialStateProperty.all(
                                        Size(35.w, 10.sp)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff73BFBD))),
                                onPressed: () {},
                                child: Text("Add To Wishlist",
                                    style: TextStyle(
                                      fontSize: 8.sp,
                                      color: Colors.white,
                                    )),
                                // label:Container(),
                                //  Icon(Icons.add,
                                //     size: 12.sp, color: Colors.white),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton.icon(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        Size(12.w, 22.sp)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
                                    fixedSize: MaterialStateProperty.all(
                                        Size(35.w, 14.sp)),
                                    backgroundColor: MaterialStateProperty.all(
                                       Color(0xffD8AA6B))),
                                onPressed: () {},
                                icon: Text("Add To Cart",
                                    style: TextStyle(
                                      fontSize: 8.sp,
                                      color: Colors.white,
                                    )),
                                label: Icon(Icons.add,
                                    size: 12.sp, color: Colors.white),
                              ),
                            ),
                            
                          ],
                        )),
                         Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 15.sp, left: 25.sp,bottom: 5.sp),
                        child: Text(
                          "Related Products",
                          style: TextStyle(
                              fontSize: 12.sp, color: Color(0xffD8AA6B)),
                        ),
                      ),
                    ),
                     Container(
              height: 18.h,
              child: ScrollWidget(children: [
                Category(
                                id: 1,
                                  image: "assets/images/bouket3.jfif",
                                  name: "Hand Bouket"),Category(
                                id: 2,
                                  image: "assets/images/bouket3.jfif",
                                  name: "Hand Bouket"),
              ]),
            ),
                  ])),
                  
            ],
          ),
        ),
      ),
    );
  }
}
