import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/models/voucher_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoucherService {
  late Dio _dio;
  late SharedPreferences prefs;
  late String token;

  Future<void> init() async {
    _dio = Dio();
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
  }

  VoucherService() {
    init();
  }

  Future<List<VoucherModel>> getVouchers() async {
    try {
      const String url = '${BaseURL.api}user/transaction/voucher';
      final response = await _dio.getUri(
        Uri.parse(url),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        final List datas = response.data["Voucher"];
        return datas.map((e) => VoucherModel.fromJson(e)).toList();
      } else {
        throw "get vouchers not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
