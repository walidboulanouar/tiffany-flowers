import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;

import 'package:ecomerceapp/services/Services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


import '../providers/UserProvider.dart';
import '../services/SqlService.dart';
import '../translations/locale_keys.g.dart';
import '../widgets/appbar_widget.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  // var user = UserData.myUser;

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  // void updateUserValue(String name) {
  //   // user.name = name;
  // }

  @override
  Widget build(BuildContext context) {
    var sqlService = SqlService();
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      width: 330,
                      child: Text(
                       LocaleKeys.WhatisYourName.tr(),
                        style: TextStyle(
                          color: Color(0xff73BFBD),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                          child: SizedBox(
                              height: 100,
                              width: 150,
                              child: TextFormField(
                                // Handles Form Validation for First Name
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return LocaleKeys.EnterYourFirstName.tr();
                                  }
                                  // else if (!isAlpha(value)) {
                                  //   return 'Only Letters Please';
                                  // }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff73BFBD)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffD8AA6B)),
                                    ),
                                    // border: InputBorder,
                                    labelText:LocaleKeys.FirstName.tr(),
                                    floatingLabelStyle:
                                        TextStyle(color: Color(0xffD8AA6B)),
                                    labelStyle:
                                        TextStyle(color: Color(0xff73BFBD))),
                                controller: firstNameController,
                              ))),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                          child: SizedBox(
                              height: 100,
                              width: 150,
                              child: TextFormField(
                                // Handles Form Validation for Last Name
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return LocaleKeys.EnterYourLastName.tr();
                                  }
                                  // else if (!isAlpha(value)) {
                                  //   return 'Only Letters Please';
                                  // }
                                  return null;
                                },
                                decoration:  InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff73BFBD)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffD8AA6B)),
                                    ),
                                    // border: InputBorder,
                                    labelText: LocaleKeys.LastName.tr(),
                                    floatingLabelStyle:
                                        TextStyle(color: Color(0xffD8AA6B)),
                                    labelStyle:
                                        TextStyle(color: Color(0xff73BFBD))),
                                controller: secondNameController,
                              )))
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 330,
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
                                    pageBuilder:
                                        (context, animation, secondaryAnimation) {
                                      return SafeArea(
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                  Response rs = await updateUserName(
                                      userProvider.user!.phone,
                                      firstNameController.text,
                                      secondNameController.text);
                                  print(rs.statusCode);
                                  print("rs.statusCode");
    
                                  if ((rs.statusCode == 200)) {
                                    sqlService.editUserName(
                                        firstNameController.text,
                                        secondNameController.text,
                                        userProvider);
    
                                    Navigator.of(context, rootNavigator: true)
                                            .canPop()
                                        ? Navigator.of(context,
                                                rootNavigator: true)
                                            .pop()
                                        : null;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Color(0xffD8AA6B),
                                        behavior: SnackBarBehavior.floating,
                                        content: Text(
                                          LocaleKeys.NameUpdated.tr(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  } else {
                                    Navigator.of(context, rootNavigator: true)
                                            .canPop()
                                        ? Navigator.of(context,
                                                rootNavigator: true)
                                            .pop()
                                        : null;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Color(0xffD8AA6B),
                                        behavior: SnackBarBehavior.floating,
                                        content: Text(
                                          LocaleKeys.NameNotUpdated.tr(),
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
                              child:  Text(
                                LocaleKeys.Update.tr(),
                                style:
                                    TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          )),
    );
  }
}
