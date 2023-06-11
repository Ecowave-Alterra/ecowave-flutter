import '../models/product_category_model.dart';

class ProductCategoryService {
  // late Dio _dio;
  // PaymentMethodRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "id": 1,
      "category": "Perabot",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 2,
      "category": "Kantong",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
  ];

  Future<List<ProductCategoryModel>> getProductCategory() async {
    try {
      // const String url = '................';
      // final response = await _dio.get(url);

      return dummy.map((e) => ProductCategoryModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
