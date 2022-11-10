import 'package:dio/dio.dart';
// import 'package:fhe_template/models/product/product.dart';

class ProductServices {
  static Future getProduts({int page = 1, String search = "all"}) async {
    var response =
        await Dio().get("https://dummyjson.com/products/search?q=$search");
    Map obj = (response.data as Map);
    return Future.value(obj);
  }

  static Future getProdutsModel({int page = 1, String search = "all"}) async {
    var response =
        await Dio().get("https://dummyjson.com/products/search?q=$search");
    Map obj = (response.data as Map);
    // return Product.fromJson(response.data);
    // return Future.value(obj);
  }

  static Future getCategories() async {
    var response = await Dio().get("https://dummyjson.com/products/categories");
    Map obj = (response.data as Map);
    return Future.value(obj);
  }
}
