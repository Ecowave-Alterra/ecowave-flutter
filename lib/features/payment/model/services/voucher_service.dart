import 'package:ecowave/features/payment/model/models/voucher_model.dart';

class VoucherService {
  // late Dio _dio;
  // VoucherRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  Map<String, dynamic> dummy = {
    "Vouchers": [
      {
        "Id": 1,
        "Type": "Diskon Belanja",
        "MinimumPurchase": 50000,
        "MaximumDiscount": 15000,
        "DiscountPercent": 20,
        "MaxClaimLimit": 2,
        "ClaimableCount": 1000,
        "StartDate": "2023-05-30T11:00:00Z",
        "EndDate": "2023-06-30T11:00:00Z"
      },
      {
        "Id": 2,
        "Type": "Gratis Ongkir",
        "ClaimableCount": 1000,
        "MaxClaimLimit": 2,
        "StartDate": "2023-05-30T11:00:00Z",
        "EndDate": "2023-06-30T11:00:00Z"
      },
      {
        "Id": 3,
        "Type": "Gratis Ongkir",
        "MinimumPurchase": 100000,
        "ClaimableCount": 1000,
        "MaxClaimLimit": 2,
        "StartDate": "2023-05-30T11:00:00Z",
        "EndDate": "2023-06-30T11:00:00Z"
      }
    ],
    "Page": 1,
    "Status": 200,
    "TotalPage": 1
  };

  Future<List<VoucherModel>> getVouchers() async {
    try {
      // const String url = '${BaseURL.api}user/payment/vouchers';
      // final response = await _dio.get(url);

      if (dummy["Status"] == 200) {
        final List<Map<String, dynamic>> datas = dummy["Vouchers"];
        return datas.map((e) => VoucherModel.fromJson(e)).toList();
      } else {
        throw "get vouchers not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
