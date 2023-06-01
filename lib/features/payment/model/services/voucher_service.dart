import 'package:ecowave/features/payment/model/models/voucher_model.dart';

class VoucherService {
  // late Dio _dio;
  // VoucherRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "name": "Voucher A",
      "discount": 0.1,
      "expired_date": "2023-06-30T11:00:00Z",
      "photo_content_url":
          "https://github.com/Ecowave-Alterra/ecowave-flutter/assets/74108522/bbbd7877-fc15-47ba-94fe-274f7a4954fd",
      "term_condition": "Syarat dan ketentuan A",
      "type": "Diskon",
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null,
    },
    {
      "name": "Voucher B",
      "discount": 0.2,
      "expired_date": "2023-06-30T11:00:00Z",
      "photo_content_url":
          "https://github.com/Ecowave-Alterra/ecowave-flutter/assets/74108522/bbbd7877-fc15-47ba-94fe-274f7a4954fd",
      "term_condition": "Syarat dan ketentuan B",
      "type": "Diskon",
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null,
    },
    {
      "name": "Voucher C",
      "discount": 0.5,
      "expired_date": "2023-06-30T11:00:00Z",
      "photo_content_url":
          "https://github.com/Ecowave-Alterra/ecowave-flutter/assets/74108522/bbbd7877-fc15-47ba-94fe-274f7a4954fd",
      "term_condition": "Syarat dan ketentuan C",
      "type": "Diskon",
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null,
    },
    {
      "name": "Voucher D",
      "discount": 0.05,
      "expired_date": "2023-06-30T11:00:00Z",
      "photo_content_url":
          "https://github.com/Ecowave-Alterra/ecowave-flutter/assets/74108522/bbbd7877-fc15-47ba-94fe-274f7a4954fd",
      "term_condition": "Syarat dan ketentuan D",
      "type": "Diskon",
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null,
    },
    {
      "name": "Voucher E",
      "discount": 20000,
      "expired_date": "2023-06-30T11:00:00Z",
      "photo_content_url":
          "https://github.com/Ecowave-Alterra/ecowave-flutter/assets/74108522/bbbd7877-fc15-47ba-94fe-274f7a4954fd",
      "term_condition": "Syarat dan ketentuan E",
      "type": "Gratis Ongkir",
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null,
    },
    {
      "name": "Voucher F",
      "discount": 40000,
      "expired_date": "2023-06-30T11:00:00Z",
      "photo_content_url":
          "https://github.com/Ecowave-Alterra/ecowave-flutter/assets/74108522/bbbd7877-fc15-47ba-94fe-274f7a4954fd",
      "term_condition": "Syarat dan ketentuan F",
      "type": "Gratis Ongkir",
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null,
    },
  ];

  Future<List<VoucherModel>> getVouchers() async {
    try {
      // const String url = '................';
      // final response = await _dio.get(url);

      return dummy.map((e) => VoucherModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
