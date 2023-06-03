import 'package:ecowave/features/payment/model/models/expedition_model.dart';

class ExpeditionService {
  // late Dio _dio;
  // AddressRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "name": "JNE",
      "price": 10000,
      "estimate": 7,
      "created_at": "2023-05-30T10:00:00Z",
      "updated_at": "2023-05-30T10:00:00Z",
      "deleted_at": null
    },
    {
      "name": "JNT",
      "price": 12000,
      "estimate": 4,
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null
    },
    {
      "name": "SiCepat",
      "price": 16000,
      "estimate": 2,
      "created_at": "2023-05-30T12:00:00Z",
      "updated_at": "2023-05-30T12:00:00Z",
      "deleted_at": null
    },
  ];

  Future<List<ExpeditionModel>> getExpeditions() async {
    try {
      // const String url = '................';
      // final response = await _dio.get(url);

      return dummy.map((e) => ExpeditionModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
