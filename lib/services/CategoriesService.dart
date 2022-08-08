import 'package:dio/dio.dart';
import 'package:ecomerceapp/providers/CategoriesProvider.dart';

import '../models/Category.dart';

var dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/api"));
getCategories(CategoriesProvider categoriesProvider)async {
  Response response=await dio.get('/categories');
print(response);
  // List<Category> categories = [];
  
  // categoriesProvider.categories = categories;
}