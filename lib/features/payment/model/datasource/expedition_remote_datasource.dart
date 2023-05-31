import 'package:ecowave/features/payment/model/response/expedition_response_model.dart';

abstract class ExpeditionRemoteDatasource {
  Future<List<ExpeditionResponseModel>> getExpeditions();
}

class ExpeditionRemoteDatasourceImpl implements ExpeditionRemoteDatasource {
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

  @override
  Future<List<ExpeditionResponseModel>> getExpeditions() async {
    // const String url = '';
    // final response = await _dio.get(url);

    return dummy.map((e) => ExpeditionResponseModel.fromJson(e)).toList();
  }
}
