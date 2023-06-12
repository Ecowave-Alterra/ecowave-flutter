import '../models/product_image_model.dart';

class ProductImageService {
  // late Dio _dio;
  // PaymentMethodRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "id": 1,
      "product_id": 1,
      "product_image_url": "assets/images/productShop1.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 2,
      "product_id": 1,
      "product_image_url": "assets/images/productShop1.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 3,
      "product_id": 1,
      "product_image_url": "assets/images/productShop1.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 4,
      "product_id": 1,
      "product_image_url": "assets/images/productShop1.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 5,
      "product_id": 2,
      "product_image_url": "assets/images/productShop2.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 6,
      "product_id": 2,
      "product_image_url": "assets/images/productShop2.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 7,
      "product_id": 3,
      "product_image_url": "assets/images/productShop3.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 8,
      "product_id": 4,
      "product_image_url": "assets/images/productShop4.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 9,
      "product_id": 5,
      "product_image_url": "assets/images/productShop5.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 10,
      "product_id": 6,
      "product_image_url": "assets/images/productShop6.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
    {
      "id": 11,
      "product_id": 7,
      "product_image_url": "assets/images/productShop7.png",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-01",
      "deleted_at": null
    },
  ];

  Future<List<ProductImageModel>> getProductImage() async {
    try {
      // const String url = '................';
      // final response = await _dio.get(url);

      return dummy.map((e) => ProductImageModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
