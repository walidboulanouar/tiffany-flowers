import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../widgets/OrderAppBar.dart';
import 'PaymentScreen.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final List<String> items = [
    "Happy Birthday",
    "Happy New Year",
    "Meri Christmass",
    "Happy Mother Day",
    "Example Here"
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(
      List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Text(item, style: TextStyle(
                      color: Color(0xff73BFBD),
                      fontSize: 10.sp,
                    ),)
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
      body: Column(
        children: [
          OrderAppBar(
            myfc: () {
              Navigator.of(context).pop();
            },
            title: "Shipping Info",
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
                    padding:  EdgeInsets.only(left:25.sp),
                    child: Text("Receiver Address",
                    style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 10.sp,
                    ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
                    color:Color.fromARGB(255, 249, 249, 249),
                    height: 5.h,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 0.05),
                            
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(width: 0.05),
                            
                          )),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:25.sp),
                    child: Text("Additional Address Info", 
                    style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 10.sp,
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
                    color:Color.fromARGB(255, 249, 249, 249),
                     height: 5.h,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 0.05),
                            
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(width: 0.05),
                            
                          )),
                    ),
                  ),
                 Padding(
                    padding:  EdgeInsets.only(left:25.sp),
                    child: Text("Receiver Phone Number", style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 10.sp,
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
                    color:Color.fromARGB(255, 249, 249, 249),
                    height: 5.h,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 0.05),
                            
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(width: 0.05),
                            
                          )),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:25.sp),
                    child: Text("Your Phone Number*", style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 10.sp,
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
                    color:Color.fromARGB(255, 249, 249, 249),
                     height: 5.h,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 0.05),
                            
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(width: 0.05),
                            
                          )),
                    ),
                  ),
                 Padding(
                    padding:  EdgeInsets.only(left:25.sp),
                    child: Text("Select Your Massage", style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 10.sp,
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
                    color:Color.fromARGB(255, 249, 249, 249),
                    height: 5.h,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          // dropdownWidth:0.w-20.sp,
                          // barrierDismissible:false,
                          iconSize: 25.sp,
                          iconEnabledColor: Color(0xff73BFBD),

                          dropdownElevation: 0,

                          isExpanded: true,
                          hint: Text(
                            '  Select Your Massage',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffDCDCDC),
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
                 Padding(
                    padding:  EdgeInsets.only(left:25.sp),
                    child: Text("Put A Phrase On The Flower Bouquet", style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 10.sp,
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
                    color:Color.fromARGB(255, 249, 249, 249),
                    height: 8.h,
                    child: TextFormField(
                      maxLines: 5,
                      decoration:  InputDecoration(
                        
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 0.05),
                            
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(width: 0.05),
                            
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 30.sp, vertical: 8.sp),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  PaymentScreen()),
                            );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.sp),
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white,fontSize: 12.sp),
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38.0),
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
