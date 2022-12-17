import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:ecomerceapp/providers/UserProvider.dart';
import 'package:ecomerceapp/screens/UpdateNumberVerification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

import '../services/Services.dart';
import '../services/SqlService.dart';
import '../translations/locale_keys.g.dart';
import '../widgets/appbar_widget.dart';
import 'HomeScreen.dart';

// This class handles the Page to edit the Phone Section of the User Profile.
class EditPhoneFormPage extends StatefulWidget {
  const EditPhoneFormPage({Key? key}) : super(key: key);
  @override
  EditPhoneFormPageState createState() {
    return EditPhoneFormPageState();
  }
}

class EditPhoneFormPageState extends State<EditPhoneFormPage> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  // var user = UserData.myUser;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void updateUserValue(String phone) {
    String formattedPhoneNumber = "(" +
        phone.substring(0, 3) +
        ") " +
        phone.substring(3, 6) +
        "-" +
        phone.substring(6, phone.length);
    // user.phone = formattedPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    var sqlService = SqlService();
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          appBar: buildAppBar(context),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: 320,
                        child: Text(
                          LocaleKeys.WhatisYourphone.tr(),
                          style: TextStyle(
                            color: Color(0xff73BFBD),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: SizedBox(
                            height: 100,
                            width: 320,
                            child: TextFormField(
                              // Handles Form Validation
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.EnterPhone.tr();
                                } else if (isAlpha(value)) {
                                  return LocaleKeys.OnlyNumbers.tr();
                                } else if (value.length < 9) {
                                  return LocaleKeys.EnterValidPhone.tr();
                                }
                                return null;
                              },
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Color(0xff73BFBD)),
                                  hintText: 'xxx xxx xxx',
                                  prefixIcon: Container(
                                      padding: EdgeInsets.only(
                                          top: 20.sp, left: 6, right: 6),
                                      child: Text(
                                        "+971",
                                        style: TextStyle(
                                            color: Color(0xffD8AA6B),
                                            fontSize: 10.sp),
                                      )),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff73BFBD)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffD8AA6B)),
                                  ),
                                  // border: InputBorder,
                                  labelText: LocaleKeys.PhoneNumber.tr(),
                                  floatingLabelStyle:
                                      TextStyle(color: Color(0xffD8AA6B)),
                                  labelStyle:
                                      TextStyle(color: Color(0xff73BFBD))),
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 320,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xffD8AA6B))),
                                onPressed: () async {
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (_formKey.currentState!.validate()) {
                                    showGeneralDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return SafeArea(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
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
                                    Response response =
                                        await sendOTPToNewNumber(
                                            userProvider.user!.phone,
                                            "+971" + phoneController.text);
                                    // print("editphone");
                                    // print(response);

                                    // print(response.statusMessage);
                                    // print(response.statusCode);
                                    if (response.statusCode == 422) {
                                      Navigator.of(context, rootNavigator: true)
                                              .canPop()
                                          ? Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop()
                                          : null;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Color(0xffD8AA6B),
                                          behavior: SnackBarBehavior.floating,
                                          content: Text(
                                            LocaleKeys.EnterValidPhone.tr(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      if (!(response.statusCode == 409)) {
                                        Navigator.of(context,
                                                    rootNavigator: true)
                                                .canPop()
                                            ? Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop()
                                            : null;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateNumberVerification(
                                                    phoneNumber: "+971" +
                                                        phoneController.text,
                                                    screen: accountScreen,
                                                  )),
                                        );
                                      } else {
                                        Navigator.of(context,
                                                    rootNavigator: true)
                                                .canPop()
                                            ? Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop()
                                            : null;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Color(0xffD8AA6B),
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              LocaleKeys.PhoneNotUpdated.tr(),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                const Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    }

                                    // updateUserValue(phoneController.text);
                                    // Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  LocaleKeys.Update.tr(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            )))
                  ]),
            ),
          )),
    );
  }
}
