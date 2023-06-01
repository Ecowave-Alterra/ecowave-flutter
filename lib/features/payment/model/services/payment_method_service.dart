import 'package:ecowave/features/payment/model/models/payment_method_model.dart';

class PaymentMethodService {
  // late Dio _dio;
  // PaymentMethodRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "name": "OVO",
      "type": "E-Wallet",
      "iconUrl": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "instructions": [""],
      "created_at": "2023-05-30T10:00:00Z",
      "updated_at": "2023-05-30T10:00:00Z",
      "deleted_at": null
    },
    {
      "name": "BCA",
      "type": "Transfer Bank",
      "iconUrl": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "instructions": [""],
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null
    },
    {
      "name": "GoPay",
      "type": "E-Wallet",
      "iconUrl": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "instructions": [""],
      "created_at": "2023-05-30T12:00:00Z",
      "updated_at": "2023-05-30T12:00:00Z",
      "deleted_at": null
    },
    {
      "name": "ShopeePay",
      "type": "E-Wallet",
      "iconUrl": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "instructions": [""],
      "created_at": "2023-05-30T13:00:00Z",
      "updated_at": "2023-05-30T13:00:00Z",
      "deleted_at": null
    },
    {
      "name": "BRI",
      "type": "Transfer Bank",
      "iconUrl": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "instructions": [""],
      "created_at": "2023-05-30T14:00:00Z",
      "updated_at": "2023-05-30T14:00:00Z",
      "deleted_at": null
    }
  ];

  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      // const String url = '................';
      // final response = await _dio.get(url);

      return dummy.map((e) => PaymentMethodModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
