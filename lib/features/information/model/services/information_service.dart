import 'package:ecowave/core.dart';
import 'package:dio/dio.dart';
import 'package:ecowave/features/information/model/models/information_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformationService {
  late Dio _dio;
  late SharedPreferences prefs;
  late String token;

  Future<void> init() async {
    _dio = Dio();
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
  }

  InformationService() {
    init();
  }
  Future<List<InformationModel>> getInformation({required int id}) async {
    try {
      String url = '${BaseURL.api}user/information?page=$id';
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List data = response.data['Informations'];
        return data.map((e) => InformationModel.fromJson(e)).toList();
      } else {
        throw 'get informations failed';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getPoint() async {
    try {
      const String url = '${BaseURL.api}user/information/point';
      final response = await _dio.getUri(
        Uri.parse(url),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        final String data = response.data['Message'];
        return data;
      } else {
        throw 'get points failed';
      }
    } catch (e) {
      rethrow;
    }
  }
}
