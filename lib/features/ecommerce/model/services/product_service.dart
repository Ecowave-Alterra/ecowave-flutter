import '../models/product_model.dart';

class ProductService {
  // late Dio _dio;
  // PaymentMethodRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "id": 1,
      "product_category_id": 1,
      "name": "Tempat Minum Reusable",
      "stock": 100,
      "price": 59000,
      "rating": 5,
      "product_description": "deskripsi Tempat Minum Reusable",
      "created_at": "2023-06-01",
      "updated_at": "2023-06-02",
      "deleted_at": null
    },
    {
      "id": 2,
      "product_category_id": 2,
      "name": "Tote Putih Polos",
      "stock": 0,
      "price": 5000,
      "rating": 4.9,
      "product_description": "deskripsi Tote Putih Polos",
      "created_at": "2023-06-02",
      "updated_at": "2023-06-03",
      "deleted_at": null
    },
    {
      "id": 3,
      "product_category_id": 1,
      "name": "Sendok Stainless Steel 8pcs",
      "stock": 50,
      "price": 30000,
      "rating": 3.8,
      "product_description": "deskripsi Sendok Stainless Steel 8pcs",
      "created_at": "2023-05-28",
      "updated_at": "2023-06-02",
      "deleted_at": null
    },
    {
      "id": 4,
      "product_category_id": 1,
      "name": "Gelas Kertas 8pcs",
      "stock": 75,
      "price": 10500,
      "rating": 4.9,
      "product_description": "deskripsi Gelas Kertas 8pcs",
      "created_at": "2023-06-02",
      "updated_at": "2023-06-03",
      "deleted_at": null
    },
    {
      "id": 5,
      "product_category_id": 2,
      "name": "Tote Bag Putih Polos",
      "stock": 75,
      "price": 7500,
      "rating": 4.2,
      "product_description": "deskripsi Tote Bag Putih Polos",
      "created_at": "2023-06-02",
      "updated_at": "2023-06-03",
      "deleted_at": null
    },
    {
      "id": 6,
      "product_category_id": 2,
      "name": "Tote Bag Hitam Polos",
      "stock": 200,
      "price": 15000,
      "rating": 4.4,
      "product_description": "deskripsi Tote Putih Polos",
      "created_at": "2023-05-30",
      "updated_at": "2023-06-03",
      "deleted_at": null
    },
    {
      "id": 7,
      "product_category_id": 2,
      "name": "Tote Bag Bahan Cotton Polos",
      "stock": 200,
      "price": 25000,
      "rating": 4.0,
      "product_description": "deskripsi Tote Bag Bahan Cotton Polos",
      "created_at": "2023-05-30",
      "updated_at": "2023-06-03",
      "deleted_at": null
    },
  ];

  Future<List<ProductModel>> getProduct() async {
    try {
      // const String url = '................';
      // final response = await _dio.get(url);

      return dummy.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
