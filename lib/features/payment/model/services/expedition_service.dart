import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/models/expedition_model.dart';
import 'package:ecowave/features/payment/model/models/expedition_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpeditionService {
  late Dio _dio;
  late SharedPreferences prefs;
  late String token;

  Future<void> init() async {
    _dio = Dio();
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
  }

  ExpeditionService() {
    init();
  }

  Future<List<ExpeditionModel>> getExpeditions(
      ExpeditionRequest request) async {
    try {
      const String url = '${BaseURL.api}user/transaction/shipping-options';
      final response = await _dio.postUri(Uri.parse(url),
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          data: request.toJson());

      if (response.statusCode == 200) {
        final List datas = response.data["Options"] ?? [];
        return datas.map((e) => ExpeditionModel.fromJson(e)).toList();
      } else {
        throw "post shipping options not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
