import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import '../providers/CartProvider.dart';
import '../providers/UserProvider.dart';
import '../services/SqlService.dart';
import '../widgets/OrderAppBar.dart';
import 'PaymentScreen.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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

  final List<String> items = [
    "Happy Birthday",
    "Happy New Year",
    "Meri Christmass",
    "Happy Mother Day",
    "Example Here"
  ];
  final List<Map<String, dynamic>> cities = [
    {"city": "Abu Dhabi", "price": 150},
    {"city": "Ajman", "price": 0},
    {"city": "Dubai", "price": 70},
    {"city": "Fujairah", "price": 150},
    {"city": "Ras Al Khaimah", "price": 150},
    {"city": "Sharjah", "price": 50},
    {"city": "Al Ain", "price": 150},
    {"city": " Umm Al Quwain", "price": 30},
  ];
  int selectedValue2=0;

  List<DropdownMenuItem<int>> _addDividersAfterItems2(
      List<Map<String, dynamic>> items) {
    List<DropdownMenuItem<int>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<int>(
            value: items.indexOf(item),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: RichText(
                text: TextSpan(
                    text: item['city'] + "(+",
                    style: TextStyle(
                        fontFamily: "Lucida Calligraphy",
                        fontSize: 10.sp,
                        color: Color(0xff73BFBD)),
                    children: <TextSpan>[
                      TextSpan(
                        text: item['price'].toString(),
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xff73BFBD)),
                      ),
                      TextSpan(
                        text: "AED)",
                        style:
                            TextStyle(fontSize: 6.sp, color: Color(0xff73BFBD)),
                      ),
                    ]),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<int>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<int> _getDividersIndexes2(items) {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }

  String selectedValue= "Happy Birthday";
  final _formKey = GlobalKey<FormState>();
  
   String? _receiver_adress;
   String? _addt_addr_info;
   String? _receiver_phone;
   String? _selected_msg;
   String? _phrase;

    String? validateMobile(String? value) {
    String patttern =
        r'(^\+((?:9[679]|8[035789]|6[789]|5[90]|42|3[578]|2[1-689])|9[0-58]|8[1246]|6[0-6]|5[1-8]|4[013-9]|3[0-469]|2[70]|7|1)(?:\W*\d){0,13}\d$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.trim().length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
   
  String? validateText(String? value) {
    
    if (value!.trim().length == 0) {
      return 'Please enter a valid input';
    
    }
    return null;
  }
  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Text(
                  item,
                  style: TextStyle(
                    color: Color(0xff73BFBD),
                    fontSize: 10.sp,
                  ),
                )),
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
            title: "Shipping Info",
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.sp),
                        child: Text(
                          "Your Phone Number*",
                          style: TextStyle(
                            color: Color(0xffD8AA6B),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 25.sp, vertical: 10.sp),
                      height: 5.h,
                      color: Color.fromARGB(255, 249, 249, 249),
                      child: TextFormField(
                        style: TextStyle(color: Color(0xff73BFBD)),
                        enabled: false,
                        initialValue: userProvider.user!.phone.toString(),
                       
                        keyboardType: TextInputType.phone,
                        onSaved: (String? val) {},
                        decoration: InputDecoration(
                           
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.sp),
                        child: Text(
                          "Select Receiver City",
                          style: TextStyle(
                            color: Color(0xffD8AA6B),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 25.sp, vertical: 10.sp),
                      height: 5.h,
                      color: Color.fromARGB(255, 249, 249, 249),
                      child: Container(
                        width: 100.w,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            // dropdownWidth:0.w-20.sp,
                            // barrierDismissible:false,
                            iconSize: 25.sp,
                            iconEnabledColor: Color(0xff73BFBD),

                            dropdownElevation: 0,

                            isExpanded: true,
                            hint: Text(
                              '  Select Receiver City',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffDCDCDC),
                              ),
                            ),
                            items: _addDividersAfterItems2(cities),
                            customItemsIndexes: _getDividersIndexes2(cities),
                            customItemsHeight: 4,
                            value: selectedValue2,
                            onChanged: (value) {
                              setState(() {
                                selectedValue2 = value as int;
                              });
                            },
                            buttonHeight: 40,
                            buttonWidth: 140,
                            itemHeight: 40,
                            itemPadding: EdgeInsets.symmetric(horizontal: 8.sp),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.sp),
                        child: Text(
                          "Receiver Address",
                          style: TextStyle(
                            color: Color(0xffD8AA6B),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 25.sp, vertical: 10.sp),
                      height: 5.h,
                      color: Color.fromARGB(255, 249, 249, 249),
                      child: TextFormField(
                        validator: validateText,
                        keyboardType: TextInputType.streetAddress,
                        onSaved: (String? val) {
                          setState(() {
                            _receiver_adress = val;
                          });
                        },
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Color(0xff73BFBD)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.sp),
                        child: Text(
                          "Additional Address Info",
                          style: TextStyle(
                            color: Color(0xffD8AA6B),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 25.sp, vertical: 10.sp),
                      height: 5.h,
                      color: Color.fromARGB(255, 249, 249, 249),
                      child: TextFormField(
                        validator: validateText,
                        keyboardType: TextInputType.streetAddress,
                        onSaved: (String? val) {
                          setState(() {
                            _addt_addr_info = val;
                          });
                        },
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Color(0xff73BFBD)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.sp),
                        child: Text(
                          "Receiver Phone Number",
                          style: TextStyle(
                            color: Color(0xffD8AA6B),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 25.sp, vertical: 10.sp),
                      height: 5.h,
                      color: Color.fromARGB(255, 249, 249, 249),
                      child: TextFormField(
                        validator: validateMobile,
                        keyboardType: TextInputType.phone,
                        onSaved: (String? val) {
                          setState(() {
                            _receiver_phone = val;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: '+212 xx xxx x xx',
                            hintStyle: TextStyle(color: Color(0xff73BFBD)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.sp),
                        child: Text(
                          "Select Your Massage",
                          style: TextStyle(
                            color: Color(0xffD8AA6B),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 25.sp, vertical: 10.sp),
                      height: 5.h,
                      color: Color.fromARGB(255, 249, 249, 249),
                      child: Container(
                        width: 100.w,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            
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
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.sp),
                        child: Text(
                          "Put A Phrase On The Flower Bouquet",
                          style: TextStyle(
                            color: Color(0xffD8AA6B),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 25.sp, vertical: 10.sp),
                      height: 8.h,
                      color: Color.fromARGB(255, 249, 249, 249),
                      child: TextFormField(
                        maxLines: 5,
                        validator: validateText,
                        keyboardType: TextInputType.text,
                        onSaved: (String? val) {
                          setState(() {
                            _phrase = val;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: 'your message here',
                            hintStyle: TextStyle(
                                color: Color(0xffDCDCDC), fontSize: 10.sp),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 0.0001),
                            )),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.sp, vertical: 8.sp),
                      child: TextButton(
                        onPressed: () {
                          //   if (_formKey.currentState!.validate()) {
                          //    _formKey.currentState!.save();
                            
                          // }


                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.sp),
                          child: Text(
                            "Checkout",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff73BFBD)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  Flexible(
//             child: ListView(

//                 // Remove padding
//                 padding: EdgeInsets.zero,
//                 children: [

//                   SizedBox(
//                     height: 1.h,
//                   ),
                  
//                   Padding(
//                     padding:  EdgeInsets.only(left:25.sp),
//                     child: Text("Receiver Address",
//                     style: TextStyle(
//                       color: Color(0xffD8AA6B),
//                       fontSize: 10.sp,
//                     ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
//                     color:Color.fromARGB(255, 249, 249, 249),
//                     height: 5.h,
//                     child: TextFormField(
//                       decoration:  InputDecoration(
                        
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(width: 0.05),
                            
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                            borderSide: BorderSide(width: 0.05),
                            
//                           )),
//                     ),
//                   ),
//                   Padding(
//                     padding:  EdgeInsets.only(left:25.sp),
//                     child: Text("Additional Address Info", 
//                     style: TextStyle(
//                       color: Color(0xffD8AA6B),
//                       fontSize: 10.sp,
//                     ),),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
//                     color:Color.fromARGB(255, 249, 249, 249),
//                      height: 5.h,
//                     child: TextFormField(
//                       decoration:  InputDecoration(
                        
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(width: 0.05),
                            
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                            borderSide: BorderSide(width: 0.05),
                            
//                           )),
//                     ),
//                   ),
//                  Padding(
//                     padding:  EdgeInsets.only(left:25.sp),
//                     child: Text("Receiver Phone Number", style: TextStyle(
//                       color: Color(0xffD8AA6B),
//                       fontSize: 10.sp,
//                     ),),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
//                     color:Color.fromARGB(255, 249, 249, 249),
//                     height: 5.h,
//                     child: TextFormField(
//                       decoration:  InputDecoration(
                        
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(width: 0.05),
                            
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                            borderSide: BorderSide(width: 0.05),
                            
//                           )),
//                     ),
//                   ),
//                   Padding(
//                     padding:  EdgeInsets.only(left:25.sp),
//                     child: Text("Your Phone Number*", style: TextStyle(
//                       color: Color(0xffD8AA6B),
//                       fontSize: 10.sp,
//                     ),),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
//                     color:Color.fromARGB(255, 249, 249, 249),
//                      height: 5.h,
//                     child: TextFormField(
//                       decoration:  InputDecoration(
                        
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(width: 0.05),
                            
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                            borderSide: BorderSide(width: 0.05),
                            
//                           )),
//                     ),
//                   ),
//                  Padding(
//                     padding:  EdgeInsets.only(left:25.sp),
//                     child: Text("Select Your Massage", style: TextStyle(
//                       color: Color(0xffD8AA6B),
//                       fontSize: 10.sp,
//                     ),),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
//                     color:Color.fromARGB(255, 249, 249, 249),
//                     height: 5.h,
//                     child: DropdownButtonHideUnderline(
//                         child: DropdownButton2(
//                           // dropdownWidth:0.w-20.sp,
//                           // barrierDismissible:false,
//                           iconSize: 25.sp,
//                           iconEnabledColor: Color(0xff73BFBD),

//                           dropdownElevation: 0,

//                           isExpanded: true,
//                           hint: Text(
//                             '  Select Your Massage',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Color(0xffDCDCDC),
//                             ),
//                           ),
//                           items: _addDividersAfterItems(items),
//                           customItemsIndexes: _getDividersIndexes(),
//                           customItemsHeight: 4,
//                           value: selectedValue,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedValue = value as String;
//                             });
//                           },
//                           buttonHeight: 40,
//                           buttonWidth: 140,
//                           itemHeight: 40,
//                           itemPadding: EdgeInsets.symmetric(horizontal: 8.sp),
//                         ),
//                       ),
//                   ),
//                  Padding(
//                     padding:  EdgeInsets.only(left:25.sp),
//                     child: Text("Put A Phrase On The Flower Bouquet", style: TextStyle(
//                       color: Color(0xffD8AA6B),
//                       fontSize: 10.sp,
//                     ),),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 25.sp, vertical:10.sp),
//                     color:Color.fromARGB(255, 249, 249, 249),
//                     height: 8.h,
//                     child: TextFormField(
//                       maxLines: 5,
//                       decoration:  InputDecoration(
                        
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(width: 0.05),
                            
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                            borderSide: BorderSide(width: 0.05),
                            
//                           )),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(
//                         horizontal: 30.sp, vertical: 8.sp),
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>  PaymentScreen()),
//                             );
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 8.sp),
//                         child: Text(
//                           "Checkout",
//                           style: TextStyle(color: Colors.white,fontSize: 12.sp),
//                         ),
//                       ),
//                       style: ButtonStyle(
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(38.0),
//                         )),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Color(0xff73BFBD)),
//                       ),
//                     ),
//                   ),
//                 ]),
//           ),
