import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';

class GetPointService {
  late Dio _dio;
  GetPointService() {
    _dio = Dio();
  }

  Future<int> getPoint() async {
    try {
      const String url = '${BaseURL.mock}user/transaction/point';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return response.data["Point"];
      } else {
        throw "get point not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
