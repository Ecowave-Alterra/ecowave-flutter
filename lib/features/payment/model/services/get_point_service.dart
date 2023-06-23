import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPointService {
  late Dio _dio;
  late SharedPreferences prefs;
  late String token;

  Future<void> init() async {
    _dio = Dio();
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
  }

  GetPointService() {
    init();
  }

  Future<int> getPoint() async {
    try {
      const String url = '${BaseURL.api}user/transaction/point';
      final response = await _dio.getUri(
        Uri.parse(url),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return int.tryParse(response.data["Point"]) ?? 0;
      } else {
        throw "get point not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
