import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../translations/locale_keys.g.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  String? validateMobile(String? value) {
    String patttern =
        r'(^\+((?:9[679]|8[035789]|6[789]|5[90]|42|3[578]|2[1-689])|9[0-58]|8[1246]|6[0-6]|5[1-8]|4[013-9]|3[0-469]|2[70]|7|1)(?:\W*\d){0,13}\d$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.trim().length == 0) {
      return LocaleKeys.Pleaseentermobilenumber.tr();
    } else if (!regExp.hasMatch("+971" + value)) {
      return LocaleKeys.Pleaseentervalidmobilenumber.tr();
    }
    return null;
  }

  String? validateEmail(String? value) {
    String patttern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(patttern);
    if (value!.trim().length == 0) {
      return LocaleKeys.Pleaseenteranemailaddress.tr();
    } else if (!regExp.hasMatch(value)) {
      return LocaleKeys.Validemailaddress.tr();
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.trim().length == 0) {
      return LocaleKeys.Enteryourname.tr();
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();
  String? _phone;
  String? _email;
  String? _firstName;
  String? _lastName;
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 3.h,
          ),
          Container(
            margin:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 10.sp),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              validator: validateName,
              keyboardType: TextInputType.name,
              onSaved: (String? val) {
                setState(() {
                  _firstName = val;
                });
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.white)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(0xffD8AA6B))),
                // label: Text("phone number"),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(0xffD8AA6B))),
                errorStyle: TextStyle(color: Color(0xffD8AA6B)),
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus ? Colors.white : Colors.white),

                labelText: LocaleKeys.FirstName.tr(),
                hintText: LocaleKeys.Enteryourfirst.tr(),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 10.sp),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              validator: validateName,
              keyboardType: TextInputType.name,
              onSaved: (String? val) {
                setState(() {
                  _lastName = val;
                });
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.white)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(0xffD8AA6B))),
                // label: Text("phone number"),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(0xffD8AA6B))),
                errorStyle: TextStyle(color: Color(0xffD8AA6B)),
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus ? Colors.white : Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                labelText: LocaleKeys.LastName.tr(),
                hintText: LocaleKeys.EnterYourlast.tr(),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 10.sp),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              validator: validateEmail,
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? val) {
                setState(() {
                  _email = val;
                });
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.white)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(0xffD8AA6B))),
                // label: Text("phone number"),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(0xffD8AA6B))),
                errorStyle: TextStyle(color: Color(0xffD8AA6B)),
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus ? Colors.white : Colors.white),

                labelText: LocaleKeys.Email.tr(),
                hintText: 'example@gmail.com',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 0.sp),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              validator: validateMobile,
              keyboardType: TextInputType.number,
              onSaved: (String? val) {
                setState(() {
                  _phone = "+971" + val!;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Container(
                      margin: EdgeInsets.only(top: 11.sp, left: 6, right: 6),
                      child: Text(
                        "+971",
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Color(0xffD8AA6B))),
                  // label: Text("phone number"),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Color(0xffD8AA6B))),
                  errorStyle: TextStyle(color: Color(0xffD8AA6B)),
                  labelStyle: TextStyle(
                      color:
                          myFocusNode.hasFocus ? Colors.white : Colors.white),
                  labelText: LocaleKeys.phonenumber.tr(),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'xxx xxx xxx'),
            ),
          ),
          Container(
            height: 5.h,
            width: 30.w,
            margin: EdgeInsets.only(top: 20.sp),
            decoration: BoxDecoration(

                // color: Colors.blue,
                borderRadius: BorderRadius.circular(50)),
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white))),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: false,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SafeArea(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
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
                  // Response response = await register(_phone!,
                  //     _email!, _firstName!, _lastName!);

                  // if (!(response.statusCode == 409)) {
                  //   Navigator.of(context, rootNavigator: true)
                  //           .canPop()
                  //       ? Navigator.of(context,
                  //               rootNavigator: true)
                  //           .pop()
                  //       : null;
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           VerificationScreen(
                  //             phoneNumber: _phone,
                  //             screen: widget.screen,
                  //           )),
                  // );
                  // } else {
                  //   Navigator.of(context, rootNavigator: true)
                  //           .canPop()
                  //       ? Navigator.of(context,
                  //               rootNavigator: true)
                  //           .pop()
                  //       : null;
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       backgroundColor: Color(0xffD8AA6B),
                  //       behavior: SnackBarBehavior.floating,
                  //       content: Text(
                  //         LocaleKeys.UserAlready.tr(),
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       duration: const Duration(seconds: 2),
                  //     ),
                  //   );
                  // }
                }
              },
              child: Text(
                LocaleKeys.SignUp.tr(),
                style: TextStyle(color: Color(0xffD8AA6B), fontSize: 10.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
