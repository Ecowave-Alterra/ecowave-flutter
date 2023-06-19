import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/models/voucher_model.dart';

class VoucherService {
  late Dio _dio;
  VoucherService() {
    _dio = Dio();
  }

  Future<List<VoucherModel>> getVouchers() async {
    try {
      const String url = '${BaseURL.mock}user/transaction/voucher';
      final response = await _dio.get(url);

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
