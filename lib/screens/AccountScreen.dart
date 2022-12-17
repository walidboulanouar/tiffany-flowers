import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecomerceapp/screens/AboutUs.dart';
import 'package:ecomerceapp/screens/Checkout.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:ecomerceapp/screens/ProfileScreen.dart';
import 'package:ecomerceapp/services/Services.dart';
import 'package:ecomerceapp/translations/locale_keys.g.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/screens/WishListScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/Category.dart';
import '../providers/CartProvider.dart';
import '../providers/IndexProvider.dart';
import '../providers/OrderProvider.dart';
import '../providers/UserProvider.dart';
import '../providers/WishListProvider.dart';
import '../services/SqlService.dart';
import '../widgets/AccountAppBar.dart';
import '../widgets/CategoryAppBar.dart';
import '../widgets/CustomBottomSheet.dart';
import '../widgets/DetailsAppBar.dart';
import 'ContactUs.dart';
import 'profile_page.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
//     Response rs=await getUserImage(userProvider.user!.phone);
// print(rs);
    var sqlService = SqlService();
    UserProvider userProvider = Provider.of<UserProvider>(context);
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    WishListProvider wlProvider = Provider.of<WishListProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          DetailsAppBar(
            myfc: () {
              indexProvider.setCurrentIndex(2);
            },
            title: LocaleKeys.MyAccount.tr(),
          ),
          Flexible(
            child: ListView(padding: EdgeInsets.only(bottom: 10.h), children: [
              SizedBox(
                height: 8.sp,
              ),
              userProvider.user != null?ListTile(
                leading: Icon(
                  Icons.person,
                  color: Color(0xff73BFBD),
                ),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                title: Text(
                  LocaleKeys.Profile.tr(),
                  style: TextStyle(fontSize: 13.sp),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ):Container(),
              ListTile(
                leading: Image.asset(
                    fit: BoxFit.contain,
                    width: 15.sp,
                    height: 15.sp,
                    "assets/images/Group 40338.png"),
                title: Text(
                  LocaleKeys.Home.tr(),
                  style: TextStyle(fontSize: 13.sp),
                ),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () {
                  mainScreen.currentState!.popUntil((route) => route.isFirst);
                  indexProvider.setCurrentIndex(2);
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                selectedTileColor: Color(0xff73BFBD),
              ),
              SizedBox(
                height: 8.sp,
              ),
              ListTile(
                leading: SvgPicture.asset(
                    width: 15.sp, height: 15.sp, "assets/images/icon (2).svg"),
                title: Text(LocaleKeys.MyOrders.tr(),
                    style: TextStyle(fontSize: 13.sp)),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () {
                  orderScreen.currentState!.popUntil((route) => route.isFirst);
                  indexProvider.setCurrentIndex(0);
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                selectedTileColor: Color(0xff73BFBD),
              ),
              SizedBox(
                height: 8.sp,
              ),
              ListTile(
                leading: SvgPicture.asset(
                    width: 15.sp, height: 15.sp, "assets/images/icon (3).svg"),
                title: Text(LocaleKeys.Categories.tr(),
                    style: TextStyle(fontSize: 13.sp)),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () {
                  categoriesScreen.currentState!
                      .popUntil((route) => route.isFirst);
                  indexProvider.setCurrentIndex(1);
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                selectedTileColor: Color(0xff73BFBD),
              ),
              SizedBox(
                height: 8.sp,
              ),
              ListTile(
                leading: SvgPicture.asset(
                    width: 15.sp, height: 15.sp, "assets/images/icon (1).svg"),
                title: Text(LocaleKeys.MyCart.tr(),
                    style: TextStyle(fontSize: 13.sp)),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () {
                  cartScreen.currentState!.popUntil((route) => route.isFirst);
                  indexProvider.setCurrentIndex(4);
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                selectedTileColor: Color(0xff73BFBD),
                trailing: Container(
                  height: 3.h,
                  width: 3.h,
                  child: Badge(
                    showBadge: cartProvider.count > 0 ? true : false,
                    position: BadgePosition.topEnd(top: 2, end: -2),
                    toAnimate: false,
                    shape: BadgeShape.circle,
                    badgeColor: Color(0xffFF7171),
                    borderRadius: BorderRadius.circular(18),
                    badgeContent: Center(
                      child: Text(
                        cartProvider.count.toString(),
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.sp,
              ),
              ListTile(
                leading: SvgPicture.asset(
                    width: 15.sp, height: 15.sp, "assets/images/icon (8).svg"),
                title: Text(LocaleKeys.WishList.tr(),
                    style: TextStyle(fontSize: 13.sp)),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () {
                  mainScreen.currentState!.popUntil((route) => route.isFirst);
                  mainScreen.currentState!.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => (WishListScreen()),
                    ),
                  );
                  indexProvider.setCurrentIndex(2);
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                trailing: Container(
                  height: 3.h,
                  width: 3.h,
                  child: Badge(
                    position: BadgePosition.topEnd(top: 2, end: -2),
                    toAnimate: false,
                    showBadge: wlProvider.count > 0 ? true : false,
                    shape: BadgeShape.circle,
                    badgeColor: Color(0xffFF7171),
                    borderRadius: BorderRadius.circular(18),
                    badgeContent: Center(
                      child: Text(
                        wlProvider.count.toString(),
                        style: TextStyle(
                          overflow: TextOverflow.visible,
                          fontSize: 9.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                selectedTileColor: Color(0xff73BFBD),
              ),
              SizedBox(
                height: 8.sp,
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: Color(0xff73BFBD),
                ),
                // SvgPicture.asset(
                //     width: 15.sp, height: 15.sp, "assets/images/icon (10).svg"),
                title: Text(
                  LocaleKeys.App_Lan.tr(),
                  style: TextStyle(fontSize: 13.sp),
                ),
                trailing: context.locale.languageCode == 'en'
                    ? SvgPicture.asset(
                        width: 60.sp,
                        height: 20.sp,
                        "assets/images/americaflag.svg")
                    : SvgPicture.asset(
                        width: 60.sp,
                        height: 20.sp,
                        "assets/images/saoudiflag.svg"),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () {
                  showModalBottomSheet(
                    useRootNavigator: true,
                    barrierColor: Colors.black.withOpacity(0.7),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    builder: (context) {
                      return CustomBottomSheet(
                        withHeader: false,
                        height: 30.h,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: LangWidget(
                            lg: context.locale.languageCode,
                          ),
                        ),
                      );
                    },
                  );
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                // trailing: Container(
                //   width: 28.w,
                //   child: Row(
                //     children: [
                //       Container(
                //         // width: 10.w,
                //         // Image.asset("assets/images/ukflag.png"),
                //         child: Text(
                //             context.locale.languageCode.toString() == 'en'
                //                 ? LocaleKeys.Eng.tr()
                //                 : LocaleKeys.Arab.tr(),
                //             style: TextStyle(
                //                 fontSize: 10.sp, color: Color(0xff73BFBD))),
                //       ),
                //       PopupMenuButton(
                //         padding: EdgeInsets.zero,
                //         icon: Icon(
                //           Icons.arrow_drop_down_sharp,
                //           size: 25.sp,
                //           color: Color(0xff73BFBD),
                //         ),
                //         onSelected: (value) {
                //           // print(value);
                //           if (value == 0) {
                //             context.setLocale(Locale('en', 'US'));

                //             pages.removeAt(3);
                //             pages.insert(
                //               3,
                //               Navigator(
                //                 key: accountScreen,
                //                 onGenerateRoute: (route) => MaterialPageRoute(
                //                     settings: route,
                //                     builder: (context) => AccountScreen(
                //                           key: UniqueKey(),
                //                         )),
                //               ),
                //             );
                //           }
                //           if (value == 1) {
                //             context.setLocale(Locale('ar', 'AE'));

                //             pages.removeAt(3);
                //             pages.insert(
                //               3,
                //               Navigator(
                //                 key: accountScreen,
                //                 onGenerateRoute: (route) => MaterialPageRoute(
                //                     settings: route,
                //                     builder: (context) => AccountScreen(
                //                           key: UniqueKey(),
                //                         )),
                //               ),
                //             );
                //           }
                //         },
                //         itemBuilder: (BuildContext bc) {
                //           return [
                //             PopupMenuItem(
                //               textStyle: TextStyle(
                //                 fontSize: 8.sp,
                //                 color: Color(0xff73BFBD),
                //               ),
                //               child: Text(LocaleKeys.Eng.tr()),
                //               value: 0,
                //             ),
                //             PopupMenuItem(
                //               textStyle: TextStyle(
                //                  fontSize: 8.sp,
                //                 color: Color(0xff73BFBD),
                //               ),
                //               child: Text(LocaleKeys.Arab.tr()),
                //               value: 1,
                //             ),
                //           ];
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                selectedTileColor: Color(0xff73BFBD),
              ),
              SizedBox(
                height: 8.sp,
              ),
              ListTile(
                leading: SvgPicture.asset(
                    width: 15.sp, height: 15.sp, "assets/images/icon (9).svg"),
                title: Text(LocaleKeys.AboutUs.tr(),
                    style: TextStyle(fontSize: 13.sp)),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutUs()),
                  );
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                selectedTileColor: Color(0xff73BFBD),
              ),
              SizedBox(
                height: 8.sp,
              ),
              ListTile(
                leading: SvgPicture.asset(
                    width: 15.sp, height: 15.sp, "assets/images/icon (5).svg"),
                title: Text(LocaleKeys.TermsConditions.tr(),
                    style: TextStyle(fontSize: 13.sp)),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () async {
                  await launchUrl(
                      Uri.parse('https://tiffanyflowers.ae/store/privacy'));
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                selectedTileColor: Color(0xff73BFBD),
              ),
              SizedBox(
                height: 8.sp,
              ),
              ListTile(
                leading: SvgPicture.asset(
                    width: 15.sp, height: 15.sp, "assets/images/icon (6).svg"),
                title: Text(LocaleKeys.PrivacyPolicy.tr(),
                    style: TextStyle(fontSize: 13.sp)),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () async {
                  await launchUrl(
                      Uri.parse('https://tiffanyflowers.ae/store/terms'));
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                selectedTileColor: Color(0xff73BFBD),
              ),
              SizedBox(
                height: 8.sp,
              ),
              ListTile(
                leading: SvgPicture.asset(
                    width: 15.sp, height: 15.sp, "assets/images/icon (7).svg"),
                title: Text(LocaleKeys.ContactUs.tr(),
                    style: TextStyle(fontSize: 13.sp)),
                minLeadingWidth: 5,
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                textColor: Color(0xffD8AA6B),
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://tiffanyflowers.ae/store/information-contact'));
                },
                hoverColor: Color(0xff73BFBD),
                dense: true,
                selectedTileColor: Color(0xff73BFBD),
              ),
              SizedBox(
                height: 8.sp,
              ),
              userProvider.user != null
                  ? ListTile(
                      leading: SvgPicture.asset(
                          width: 15.sp,
                          height: 15.sp,
                          "assets/images/Iconly-Light-Outline-Logout.svg"),
                      title: Text(LocaleKeys.Sign_out.tr(),
                          style: TextStyle(fontSize: 13.sp)),
                      minLeadingWidth: 5,
                      contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                      textColor: Color.fromRGBO(216, 170, 107, 1),
                      onTap: () {
                        sqlService.deleteUser(userProvider);
                        sqlService.clearWishList(wlProvider);
                        sqlService.deleteCartItems(cartProvider);

                        orderProvider.removeOrders();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color(0xffD8AA6B),
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              LocaleKeys.Youarelogout.tr(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                        indexProvider.setCurrentIndex(2);
                      },
                      hoverColor: Color(0xff73BFBD),
                      dense: true,
                      selectedTileColor: Color(0xff73BFBD),
                    )
                  : Container(),
              SizedBox(
                height: 8.sp,
              ),
              userProvider.user != null
                  ? ListTile(
                      leading: SvgPicture.asset(
                          color: Color(0xff73BFBD),
                          width: 15.sp,
                          height: 15.sp,
                          "assets/images/delete-button.svg"),
                      title: Text(LocaleKeys.DeleteAccount.tr(),
                          style: TextStyle(fontSize: 13.sp)),
                      minLeadingWidth: 5,
                      contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                      textColor: Color(0xffD8AA6B),
                      onTap: () {
                        AwesomeDialog(
                          btnCancelText: LocaleKeys.Cancel.tr(),
                          btnOkText: LocaleKeys.Delete.tr(),
                          context: context,
                          titleTextStyle: TextStyle(
                            fontSize: 10.sp,
                            color: Color(0xff73BFBD),
                          ),
                          descTextStyle: TextStyle(
                            fontSize: 8.sp,
                            color: Color(0xffD8AA6B),
                          ),
                          buttonsTextStyle: TextStyle(fontSize: 8.sp),
                          btnOkColor: Color(0xff73BFBD),
                          btnCancelColor: Color(0xffD8AA6B),
                          dialogType: DialogType.WARNING,
                          animType: AnimType.RIGHSLIDE,
                          title: LocaleKeys.sure.tr(),
                          desc: LocaleKeys.ProcessCannotBeUndone.tr(),
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            deleteAccount(userProvider.user!.phone);
                            sqlService.deleteUser(userProvider);
                            sqlService.clearWishList(wlProvider);
                            sqlService.deleteCartItems(cartProvider);
                          },
                        ).show();
                      },
                      hoverColor: Color(0xff73BFBD),
                      dense: true,
                      selectedTileColor: Color(0xff73BFBD),
                    )
                  : Container(),
              SizedBox(
                width: 100.h,
                height: 3.h,
              ),
              InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse('https://www.its.ae/'));
                },
                child: Image.asset(
                  'assets/images/big-bang.png',
                  color: Color(0xff966F41),
                  width: 50,
                  height: 40,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
