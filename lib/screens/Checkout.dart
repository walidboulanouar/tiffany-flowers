import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:ecomerceapp/providers/LoadingProvider.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/services/Services.dart';
import 'package:ecomerceapp/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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
  int selectedValue2 = 0;

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
                        fontFamily: GoogleFonts.openSans().fontFamily,
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

  String? selectedValue;
  final _formKey = GlobalKey<FormState>();

  String? _receiver_adress;
  String? _addt_addr_info;
  String? _receiver_phone;

  String? _phrase;

  String? validateMobile(String? value) {
    String patttern =
        r'(^\+((?:9[679]|8[035789]|6[789]|5[90]|42|3[578]|2[1-689])|9[0-58]|8[1246]|6[0-6]|5[1-8]|4[013-9]|3[0-469]|2[70]|7|1)(?:\W*\d){0,13}\d$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.trim().length == 0) {
      return LocaleKeys.Pleaseentermobilenumber.tr();
    } else if (!regExp.hasMatch("+971"+value)) {
      return LocaleKeys.Pleaseentervalidmobilenumber.tr();
    }
    return null;
  }

  String? validateText(String? value) {
    if (value!.trim().length == 0) {
      return LocaleKeys.Pleaseenteravalidinput.tr();
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
    // var sqlService = SqlService();
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    LoadingProvider loadingProvider = Provider.of<LoadingProvider>(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            OrderAppBar(
              myfc: () {
                Navigator.of(context).pop();
              },
              title: LocaleKeys.ShippingInfo.tr(),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 30, top: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.sp),
                          child: Text(
                            LocaleKeys.YourPhoneNumber.tr(),
                            style: TextStyle(
                              color: Color(0xffD8AA6B),
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 249, 249, 249),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 25.sp, vertical: 10.sp),
                        // height: 5.h,

                        // color: Color.fromARGB(255, 249, 249, 249),
                        child: TextFormField(
                          maxLines: 1,
                          minLines: 1,
                          style: TextStyle(
                              color: Color(0xff73BFBD), fontSize: 10.sp),
                          enabled: false,
                          initialValue: userProvider.user!.phone.toString(),
                          // keyboardType: TextInputType.phone,
                          onSaved: (String? val) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(color: Color(0xff73BFBD)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color.fromARGB(255, 249, 249, 249))),
                            // enabledBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            //   borderSide: BorderSide(
                            //     width: 0.001,
                            //     color: Color.fromARGB(255, 249, 249, 249),
                            //   ),
                            // ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0.001,
                                color: Color.fromARGB(255, 249, 249, 249),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.sp),
                          child: Text(
                            LocaleKeys.SelectReceiverCity.tr(),
                            style: TextStyle(
                              color: Color(0xffD8AA6B),
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 249, 249, 249),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 25.sp, vertical: 10.sp),
                        height: 5.h,
                        child: Container(
                          width: 100.w,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              dropdownWidth: 83.w,
                              iconSize: 25.sp,
                              iconEnabledColor: Color(0xff73BFBD),
                              dropdownElevation: 2,
                              isExpanded: true,
                              hint: Text(
                                LocaleKeys.SelectReceiverCity.tr(),
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
                              buttonHeight: 30.sp,
                              buttonWidth: 140,
                              itemHeight: 30.sp,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 8.sp),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.sp),
                          child: Text(
                            LocaleKeys.ReceiverAddress.tr(),
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
                        color: Color.fromARGB(255, 249, 249, 249),
                        child: TextFormField(
                          maxLines: 1,
                          minLines: 1,
                          style: TextStyle(color: Color(0xff73BFBD)),
                          validator: validateText,
                          keyboardType: TextInputType.streetAddress,
                          onSaved: (String? val) {
                            setState(() {
                              _receiver_adress = val;
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(color: Color(0xff73BFBD)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 0.001,
                                  color: Color.fromARGB(255, 249, 249, 249),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 0.001,
                                  color: Color.fromARGB(255, 249, 249, 249),
                                ),
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.sp),
                          child: Text(
                            LocaleKeys.AdditionalAddressInfo.tr(),
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
                        color: Color.fromARGB(255, 249, 249, 249),
                        child: TextFormField(
                          maxLines: 1,
                          minLines: 1,
                          style: TextStyle(color: Color(0xff73BFBD)),
                          validator: validateText,
                          keyboardType: TextInputType.streetAddress,
                          onSaved: (String? val) {
                            setState(() {
                              _addt_addr_info = val;
                            });
                          },
                          decoration: InputDecoration(

                              // errorStyle: ,
                              // counterText: ' ',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(color: Color(0xff73BFBD)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 0.001,
                                  color: Color.fromARGB(255, 249, 249, 249),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 0.001,
                                  color: Color.fromARGB(255, 249, 249, 249),
                                ),
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.sp),
                          child: Text(
                            LocaleKeys.ReceiverPhoneNumber.tr(),
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
                        // height: 5.h,
                        color: Color.fromARGB(255, 249, 249, 249),
                        child: TextFormField(
                          maxLines: 1,
                          minLines: 1,
                          style: TextStyle(color: Color(0xff73BFBD)),
                          validator: validateMobile,
                          keyboardType: TextInputType.number,
                          onSaved: (String? val) {
                            setState(() {
                              _receiver_phone = "+971" + val!;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                              prefixIcon: Container(
                                  margin: EdgeInsets.only(
                                      top: 12.sp, left: 6, right: 6),
                                  child: Text(
                                    "+971",
                                    style: TextStyle(
                                        color: Color(0xff73BFBD),
                                        fontSize: 10.sp),
                                  )),
                              hintText: 'xxx xxx xxx',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 104, 110, 110),
                                  fontSize: 10.sp),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 0.001,
                                  color: Color.fromARGB(255, 249, 249, 249),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 0.001,
                                  color: Color.fromARGB(255, 249, 249, 249),
                                ),
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.sp),
                          child: Text(
                            LocaleKeys.SelectYourMessage.tr(),
                            style: TextStyle(
                              color: Color(0xffD8AA6B),
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 249, 249, 249),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 25.sp, vertical: 10.sp),
                        height: 5.h,
                        child: Container(
                          width: 100.w,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              iconSize: 25.sp,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              dropdownWidth: 83.w,
                              iconEnabledColor: Color(0xff73BFBD),
                              dropdownElevation: 2,
                              isExpanded: true,
                              hint: Text(
                                LocaleKeys.SelectYourMessage.tr(),
                                style: TextStyle(
                                  fontSize: 16,
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
                              buttonHeight: 30.sp,
                              buttonWidth: 140,
                              itemHeight: 30.sp,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 8.sp),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.sp),
                          child: Text(
                            LocaleKeys.PutAPhrase.tr(),
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
                        // height: 8.h,
                        color: Color.fromARGB(255, 249, 249, 249),
                        child: TextFormField(
                          style: TextStyle(color: Color(0xff73BFBD)),
                          minLines: 1,
                          maxLines: 3,
                          validator: validateText,
                          keyboardType: TextInputType.text,
                          onSaved: (String? val) {
                            setState(() {
                              _phrase = val;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                              hintText: LocaleKeys.Yourmessagehere.tr(),
                              hintStyle: TextStyle(
                                  color: Color(0xffDCDCDC), fontSize: 10.sp),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 0.001,
                                  color: Color.fromARGB(255, 249, 249, 249),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 0.001,
                                  color: Color.fromARGB(255, 249, 249, 249),
                                ),
                              )),
                        ),
                      ),
                      Container(
                        width: 100.w,
                        margin: EdgeInsets.symmetric(
                            horizontal: 30.sp, vertical: 8.sp),
                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              showGeneralDialog(
                                context: context,
                                barrierDismissible: false,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return SafeArea(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      padding: EdgeInsets.all(20),
                                      color: Colors.transparent,
                                      child: Center(
                                        child: SpinKitWave(
                                          // duration: const Duration(seconds: 10),
                                          color: Color(0xff73BFBD),
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                              Response response = await addOrder(
                                userProvider.user!,
                                cartProvider.subTotal(),
                                cartProvider.itemCount(),
                                cities[selectedValue2]['price'],
                                _receiver_adress!,
                                userProvider.user!.phone,
                                _receiver_phone!,
                                _addt_addr_info!,
                                selectedValue ?? 'NONE',
                                _phrase!,
                                cartProvider.items,
                                cities[selectedValue2]['city'],
                                loadingProvider,
                              );

                              if (response.statusCode == 200) {
                                final jsonData = jsonDecode(response.data);
                                Navigator.of(context, rootNavigator: true)
                                        .canPop()
                                    ? Navigator.of(context, rootNavigator: true)
                                        .pop()
                                    : null;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentScreen(
                                            subTotal: cartProvider.subTotal(),
                                            screen: cartScreen,
                                            shpping: cities[selectedValue2]
                                                ['price'],
                                            url: jsonData['result']
                                                ['redirectUrl'],
                                          )),
                                );
                              } else {
                                print(response);
                                Navigator.of(context, rootNavigator: true)
                                        .canPop()
                                    ? Navigator.of(context, rootNavigator: true)
                                        .pop()
                                    : null;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Color(0xffD8AA6B),
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      LocaleKeys.Somthingwrong.tr(),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.sp),
                            child: Text(
                              LocaleKeys.Checkout.tr(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
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
      ),
    );
  }
}
