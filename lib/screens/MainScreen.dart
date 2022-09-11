import 'package:ecomerceapp/screens/CategoriesScreen.dart';
import 'package:ecomerceapp/services/Services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/Category.dart';
import '../models/Product.dart';
import '../providers/BannerProvider.dart';

import '../providers/CartProvider.dart';
import '../providers/CategoriesProvider.dart';
import '../providers/IndexProvider.dart';
import '../providers/ProductProvider.dart';
import '../providers/WishListProvider.dart';
import '../services/SqlService.dart';
import '../widgets/CarouselImage.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/ProductScrollWidget.dart';
import '../widgets/ScrollWidget.dart';
import '../widgets/TextTitle.dart';
import 'HomeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    BannerProvider bannertProvider =
        Provider.of<BannerProvider>(context, listen: false);
    CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    getBanners(bannertProvider);

    getCategories(categoriesProvider);
    getProducts(productProvider);
     WishListProvider wlProvider =
        Provider.of<WishListProvider>(context, listen: false);
    var sqlService = SqlService();
     
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    sqlService.getItems(cartProvider);
     sqlService.getProducts(wlProvider);
   
  }

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    BannerProvider bannerProvider = Provider.of<BannerProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context);
    List<Product> newProducts = productProvider.products.length > 10
        ? productProvider.products.sublist(0, 10)
        : productProvider.products;
    List<Product> sortedProducts = [...productProvider.products];
    sortedProducts.sort((a, b) => b.view.compareTo(a.view));
List<Product> mostViewProducts=sortedProducts.length > 10
        ? sortedProducts.sublist(0, 10)
        : sortedProducts;
    List<Category> categories = categoriesProvider.categories.length > 10
        ? categoriesProvider.categories.sublist(0, 10)
        : categoriesProvider.categories;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomAppBar(),
        Flexible(
          child: ListView(
            padding: EdgeInsets.only(top: 0.sp,bottom: 40.sp,left:0.sp,right:0.sp),
             children: [
            CarouselImage(banners: bannerProvider.banners),
            TextTitle(
              title: "Categories",
            ),
            Container(
              height: 24.h,
              child: ScrollWidget(children: categories),
            ),
            Center(
                child: InkWell(
              onTap: () {
                categoriesScreen.currentState!
                    .popUntil((route) => route.isFirst);
                indexProvider.setCurrentIndex(1);
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.sp),
                child: Text("View All",
                    style: TextStyle(fontSize: 7.sp, color: Color(0xffB5B5B5))),
              ),
            )),
            TextTitle(
              title: "New Items",
            ),
            Container(
              height: 24.h,
              child: ProductScrollWidget(children: newProducts),
            ),
            TextTitle(
              title: "Mostview Products",
            ),
            Container(
              height: 24.h,
              child: ProductScrollWidget(children: mostViewProducts),
            ),
          ]),
        ),
      ],
    );
  }
}
