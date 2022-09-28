import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:ecomerceapp/models/FeatureValue.dart';

import 'package:ecomerceapp/widgets/DetailsAppBar.dart';

import 'package:ecomerceapp/widgets/NoLoppingSlider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import '../models/CartItem.dart';

import '../models/Feature.dart';
import '../providers/CartProvider.dart';
import '../providers/IndexProvider.dart';
import '../providers/ProductProvider.dart';
import '../providers/WishListProvider.dart';
import '../services/Services.dart';
import '../services/SqlService.dart';
import '../translations/locale_keys.g.dart';
import '../widgets/CountButton.dart';
import '../widgets/MyColorPicker.dart';
import '../widgets/ProductScrollWidget.dart';
import '../widgets/ScrollWidget.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';

class DetailsScreen extends StatefulWidget {
  int productId;

  DetailsScreen({Key? key, required this.productId}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    getProductById(
      widget.productId,
      productProvider,
    );
    // TODO: implement initState
  }

  // final List<Map<String, dynamic>> items = [
  //   {"title": 'Small', "price": 55, "color": Color(0xff73BFBD)},
  //   {"title": 'Eduim', "price": 90, "color": Color(0xff73BFBD)},
  //   {"title": 'Large', "price": 100, "color": Color(0xffD8AA6B)}
  // ];
  int selectedValue = 0;
  Color _color = Color(0xffD8AA6B);
  int _productCount = 1;

  List<DropdownMenuItem<int>> _addDividersAfterItems(List<FeatureValue> items) {
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
                    text: item.value + "(+",
                    style: TextStyle(
                        fontFamily: "Lucida Calligraphy",
                        fontSize: 10.sp,
                        color: Color(0xff73BFBD)),
                    children: <TextSpan>[
                      TextSpan(
                        text: item.price.toString(),
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

  List<int> _getDividersIndexes(items) {
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

    WishListProvider wlProvider = Provider.of<WishListProvider>(context);

    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    List<Color> colors = [];
    List<FeatureValue> size = [];
    if (productProvider.selectedProduct != null) {
      List<Feature> colors1 = productProvider.selectedProduct!.features!
          .where((feature) => feature.name == "colors")
          .toList();
      if (colors1.isNotEmpty) {
        colors = colors1[0]
            .values
            .map((val) => Color(int.parse(val.value)))
            .toList();
      }
      List<Feature> size1 = productProvider.selectedProduct!.features!
          .where((feature) => feature.name == "size")
          .toList();
      print(size1);
      size = size1[0].values;
    }

    int sizePrice = size.isNotEmpty ? size[selectedValue].price : 0;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Container(
          height: 6.h,
          width: 6.h,
          child: FloatingActionButton(
            heroTag: Text("btn4"),
            backgroundColor: Colors.green,
            onPressed: () {
              openWhatsap();
            },
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
                  myfc: () {
                    Navigator.pop(context);
                  },
                  title: LocaleKeys.Details.tr(),
                ),
                // SizedBox(
                //   height: 2.h,
                // ),
                Flexible(
                    child: ListView(
                        padding: EdgeInsets.only(top: 5.sp, bottom: 50.sp),
                        children: [
                      productProvider.selectedProduct != null
                          ? NoLoopingSlider(
                              imgList:
                                  // productProvider.selectedProduct != null
                                  // ?
                                  productProvider.selectedProduct!.images
                              // : []
                              )
                          : Container(
                              height: 15.w, width: 15.w, color: Colors.grey),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.sp),
                          child: Text(
                            textAlign: TextAlign.center,
                            productProvider.selectedProduct != null
                                ? productProvider.selectedProduct!.name.toLowerCase()
                                : "",
                            style: TextStyle(
                                fontSize: 12.sp, color: Color(0xffD8AA6B)),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 35.w,
                          height: 6.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.sp,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xff73BFBD)),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    _productCount > 1
                                        ? setState(() {
                                            _productCount -= 1;
                                          })
                                        : null;
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 17.sp,
                                  )),
                              Flexible(
                                child: Center(
                                  child: Container(
                                    // margin: EdgeInsets.symmetric(horizontal: 3),
                                    padding: EdgeInsets.only(
                                        bottom: 4.sp, left: 12.sp, right: 12.sp),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Color(0xff73BFBD)),
                                    child: Text(
                                      _productCount.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _productCount += 1;
                                    });
                                  },
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
                            LocaleKeys.AvailableOptions.tr(),
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
                                  "${LocaleKeys.Color.tr()}:",
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Color(0xff73BFBD)),
                                ),
                                SizedBox(
                                  width: 40.sp,
                                ),
                                Container(
                                  // color: Colors.red,
                                  height: 5.h,
                                  width: 60.w,
                                  child: MyColorPicker(
                                      onSelectColor: (value) {
                                        setState(() {
                                          _color = value;
                                        });
                                      },
                                      availableColors:
                                          productProvider.selectedProduct != null
                                              ? colors
                                              : [],
                                      initialColor: Colors.blue),
                                )
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
                            dropdownDecoration: BoxDecoration(
    
                              borderRadius:  BorderRadius.circular(10),
                            ),
                            
                            dropdownWidth:83.w,
                            
                            // barrierDismissible:false,
                            iconSize: 25.sp,
                            iconEnabledColor: Color(0xff73BFBD),
    
                            dropdownElevation: 1,
    
                            isExpanded: true,
                            hint: Text(
                              'Size',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff73BFBD),
                              ),
                            ),
                            items: _addDividersAfterItems(
                              productProvider.selectedProduct != null ? size : [],
                            ),
                            customItemsIndexes: _getDividersIndexes(size),
                            customItemsHeight: 4,
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as int;
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
                                    LocaleKeys.About.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xffD8AA6B)),
                                  )),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      productProvider.selectedProduct != null
                                          ? productProvider
                                              .selectedProduct!.description.toLowerCase()
                                          : "",
                                      style: TextStyle(
                                          height: 2,
                                          fontSize: 10.sp,
                                          color:
                                              Color.fromARGB(121, 80, 80, 80)))),
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
                                    LocaleKeys.PriceUnit.tr(),
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff73BFBD)),
                                  )),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: RichText(
                                  text: TextSpan(
                                      text: productProvider.selectedProduct !=
                                              null
                                          ? productProvider.selectedProduct!.price
                                              .toString()
                                          : "",
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
                                      text: LocaleKeys.TotalPrice.tr(),
                                      style: TextStyle(
                                          fontFamily: "Lucida Calligraphy",
                                          fontSize: 12.sp,
                                          color: Colors.white),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '( ${LocaleKeys.IncludeTax.tr()})',
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
                                      text: productProvider.selectedProduct !=
                                              null
                                          ? (((productProvider.selectedProduct!
                                                              .price +
                                                          sizePrice) *
                                                      _productCount) +
                                                  ((productProvider
                                                                  .selectedProduct!
                                                                  .price +
                                                              sizePrice) *
                                                          _productCount) *
                                                      0.05)
                                              .toString()
                                          : "",
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
                            color: Colors.white,
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
                                  onPressed: () {
                                    sqlService.saveProduct(
                                        productProvider.selectedProduct!.id,
                                        wlProvider);
                                    showGeneralDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return SafeArea(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
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
                                                child: Lottie.asset(
                                                    "assets/images/wishlist.json"),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(LocaleKeys.AddToWishlist.tr(),
                                      style: TextStyle(
                                        fontSize: 7.sp,
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
                                  onPressed: () {
                                    // cartProvider.
                                    sqlService.addToCart(
                                        CartItem(
                                            productId: productProvider
                                                .selectedProduct!.id,
                                            name: productProvider
                                                .selectedProduct!.name,
                                            color: _color.value,
                                            count: _productCount,
                                            image: productProvider
                                                .selectedProduct!.images[0]
                                                .toString(),
                                            price: productProvider
                                                .selectedProduct!.price,
                                            size: size.isNotEmpty
                                                ? size[selectedValue].value
                                                : "standart",
                                            sizePrice: sizePrice),
                                        cartProvider);
                                    AwesomeDialog(
                                      btnCancelText: LocaleKeys.ContinueShopping.tr(),
                                      btnOkText: LocaleKeys.CheckOut.tr(),
                                      btnOkColor: Color(0xffD8AA6B),
                                      btnCancelColor: Color(0xff73BFBD),
                                      context: context,
                                      dialogType: DialogType.SUCCES,
                                      animType: AnimType.RIGHSLIDE,
                                      title: LocaleKeys.YourOrderHasBeenAdded.tr(),
                                      titleTextStyle: TextStyle(
                                        color: Color(0xffD8AA6B),
                                        fontSize: 11.sp,
                                      ),
                                      desc:LocaleKeys.SuccessfullyAddedToCart.tr(),
                                      descTextStyle: TextStyle(
                                        color: Color(0xff73BFBD),
                                        fontSize: 8.5.sp,
                                      ),
                                      btnCancelOnPress: () {},
                                      buttonsTextStyle: TextStyle(
                                        fontSize: 7.2.sp,
                                      ),
                                      btnOkOnPress: () {
                                        cartScreen.currentState!
                                            .popUntil((route) => route.isFirst);
                                        indexProvider.setCurrentIndex(4);
                                      },
                                    ).show();
                                    
                                  },
                                  icon: Text(LocaleKeys.Add_To_Cart.tr(),
                                      style: TextStyle(
                                        fontSize: 7.sp,
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
                          margin: EdgeInsets.only(
                              top: 15.sp, left: 25.sp, bottom: 5.sp),
                          child: Text(
                            LocaleKeys.RelatedProducts.tr(),
                            style: TextStyle(
                                fontSize: 12.sp, color: Color(0xffD8AA6B)),
                          ),
                        ),
                      ),
                      Container(
                        height: 18.h,
                        child: productProvider.selectedProduct != null
                            ? ProductScrollWidget(
                                children: productProvider
                                    .selectedProduct!.product_related!
                                
                                )
                            : Container(),
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
