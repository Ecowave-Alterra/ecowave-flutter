import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/models/expedition_model.dart';
import 'package:ecowave/features/payment/model/models/expedition_request.dart';

class ExpeditionService {
  late Dio _dio;
  ExpeditionService() {
    _dio = Dio();
  }

  Future<List<ExpeditionModel>> getExpeditions(
      ExpeditionRequest request) async {
    try {
      const String url = '${BaseURL.mock}user/transaction/shipping-options';
      final response = await _dio.post(url, data: request.toJson());

      if (response.statusCode == 200) {
        final List datas = response.data["Options"];
        return datas.map((e) => ExpeditionModel.fromJson(e)).toList();
      } else {
        throw "post shipping options not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
