import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecomerceapp/providers/BannerProvider.dart';
import 'package:ecomerceapp/providers/CategoriesProvider.dart';
import 'package:ecomerceapp/providers/ProductProvider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/Banner.dart';
import '../models/CartItem.dart';
import '../models/Category.dart';
import '../models/Product.dart';
import '../providers/CartProvider.dart';
import '../providers/WishListProvider.dart';

var dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/api"));
getCategories(CategoriesProvider categoriesProvider) async {
  Response response = await dio.get('/categories');

  List<Category> categories = [];
  response.data['data'].forEach((cat) {
    Category category = Category.fromJson(cat);
    
    categories.add(category);
  });

  categoriesProvider.categories = categories;
}

getProductsByCatgory(int catId, ProductProvider productProvider) async {

  Response response = await dio.get('/categories/${catId}');
  List<Product> products = [];
  response.data['data']['products'].forEach((pro) {
    Product product = Product.fromJson(pro);
  
    products.add(product);
  });
 
  productProvider.categoryproducts = products;
}

getProductById(int productId, ProductProvider productProvider) async {
  
  Response response = await dio.get('/products/${productId}');
  Product product = Product.fromJson(response.data['data']);
  
 
  productProvider.selectedProduct = product;
}

getBanners(BannerProvider bannerProvider) async {
  Response response = await dio.get('/banners');


  List<Banner> banners = [];
  response.data['data'].forEach((ban) {
    Banner banner = Banner.fromJson(ban);

    banners.add(banner);
  });

  bannerProvider.banners = banners;
}

getProducts(ProductProvider productProvider) async {
  Response response = await dio.get('/products');

  List<Product> products = [];
  response.data['data'].forEach((pro) {
    Product product = Product.fromJson(pro);
    products.add(product);
  });

  productProvider.products = products;
 
}

getProductByIds(List<int> productsId, WishListProvider wlProvider) async {
  List<Product> products = [];
  for (int i = 0; i < productsId.length; i++) {
    Response response = await dio.get('/products/${productsId[i]}');
    Product product = Product.fromJson(response.data['data']);

    products.add(product);
  }
  

  wlProvider.wishListProducts = products;
}
register(String phone,String email,String firsName,String lastName) async {
 
  
    Response response = await dio.post('/register',data:{
     "phone_number": phone,
     "first_name":firsName,
        "last_name":lastName,
        "email":email
   
},options:
Options (
 validateStatus: (_) => true,
 contentType: Headers.jsonContentType,
 responseType:ResponseType.json,
));
print(response);

   
   
}
Future<Response> verifyPhone(String phone,int otp,) async {
 
  
  
 Response response = await dio.post('/verify-phone-number',data:{
    "phone_number": phone
     ,
     "otp":otp

   
},
options:
Options (
 validateStatus: (_) => true,
 contentType: Headers.jsonContentType,
 responseType:ResponseType.json,
));
return response;

   
   
}

openWhatsap() async {
  var whatsapp = "+212650398901";
  String whatsappURLAndroid =
      "whatsapp://send?phone=$whatsapp&text=hello";
  String whatsappURLIOS = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  if (Platform.isIOS) {
      
      try {
        await launchUrl(Uri.parse(whatsappURLIOS));
      } catch (error) {
        print("~~~~~~~~~~");
        print(error.toString());
       
      }
    } else if (Platform.isAndroid) {
      try {
        await launchUrl(Uri.parse(whatsappURLAndroid));
      } catch (error) {
        print("~~~~~~~~~~");
        print(error.toString());
        
      }
    }
}
