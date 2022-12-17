import 'dart:async';

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/User.dart';
import '../providers/UserProvider.dart';
import '../services/Services.dart';
import '../services/SqlService.dart';
import '../translations/locale_keys.g.dart';
import '../widgets/display_image_widget.dart';
import 'edit_email.dart';
import 'edit_image.dart';
import 'edit_name.dart';
import 'edit_phone.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  bool? reload;
  ProfilePage({Key? key, this.reload}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    var sqlService = SqlService();

    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    getUserImage(userProvider.user!.phone, userProvider);

    sqlService.getUser(userProvider);
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
   
   

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 10,
            ),
            Center(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      LocaleKeys.EditProfil.tr(),
                      style: TextStyle(
                        fontSize: 20.sp,
                        // fontWeight: FontWeight.w700,
                        color: Color(0xff73BFBD),
                      ),
                    ))),
            InkWell(
                onTap: () {
                  navigateSecondPage(EditImagePage());
                },
                child: userProvider.userImage != null
                    ? DisplayImage(
                        imagePath: userProvider.userImage.toString(),
                        //  userProvider.userImage.toString(),
                        onPressed: () {},
                      )
                    : CircleAvatar(
                        radius: 75,
                        backgroundColor: Color(0xff73BFBD),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff73BFBD),
                          backgroundImage:
                              AssetImage("assets/images/userimage.png"),
                          radius: 70,
                        ),
                      )),
            buildUserInfoDisplay(
                userProvider.user!.firstName.toString() +
                    " " +
                    userProvider.user!.lastName.toString(),
                LocaleKeys.Name.tr(),
                EditNameFormPage()),
            buildUserInfoDisplay(userProvider.user!.phone.toString(),
                LocaleKeys.Phone.tr(), EditPhoneFormPage()),
            buildUserInfoDisplay(userProvider.user!.email.toString(),
                LocaleKeys.Email.tr(), EditEmailFormPage()),
          ],
        ),
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.sp),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffD8AA6B),
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Color.fromARGB(255, 237, 233, 233),
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: TextStyle(
                                  fontSize: 16,
                                  height: 1.4,
                                  color: Color(0xff73BFBD)),
                            ))),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xffD8AA6B),
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
