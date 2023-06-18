import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';

import '../models/product_model.dart';

class ProductService {
  late Dio _dio;
  ProductService() {
    _dio = Dio();
  }

  Future<List<ProductModel>> getProduct() async {
    try {
      const String url = '${BaseURL.mock}user/ecommerce/91203872';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List datas = response.data["Products"];
        return datas.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw "get products failed";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Review>> getProductRating() async {
    try {
      const String url = '${BaseURL.mock}user/ecommerce/91203872';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List datas = response.data["Product"];
        return datas.map((e) => Review.fromJson(e)).toList();
      } else {
        throw "get ratings failed";
      }
    } catch (e) {
      rethrow;
    }
  }
}
