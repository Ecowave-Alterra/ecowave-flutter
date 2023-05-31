import 'package:ecowave/features/payment/model/response/payment_method_response_model.dart';

abstract class PaymentMethodRemoteDatasource {
  Future<List<PaymentMethodResponseModel>> getPaymentMethods();
}

class PaymentMethodRemoteDatasourceImpl
    implements PaymentMethodRemoteDatasource {
  // late Dio _dio;
  // PaymentMethodRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "name": "OVO",
      "type": "E-Wallet",
      "instructions": [""],
      "created_at": "2023-05-30T10:00:00Z",
      "updated_at": "2023-05-30T10:00:00Z",
      "deleted_at": null
    },
    {
      "name": "BCA",
      "type": "Transfer Bank",
      "instructions": [""],
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null
    },
    {
      "name": "GoPay",
      "type": "E-Wallet",
      "instructions": [""],
      "created_at": "2023-05-30T12:00:00Z",
      "updated_at": "2023-05-30T12:00:00Z",
      "deleted_at": null
    },
    {
      "name": "ShopeePay",
      "type": "E-Wallet",
      "instructions": [""],
      "created_at": "2023-05-30T13:00:00Z",
      "updated_at": "2023-05-30T13:00:00Z",
      "deleted_at": null
    },
    {
      "name": "BRI",
      "type": "Transfer Bank",
      "instructions": [""],
      "created_at": "2023-05-30T14:00:00Z",
      "updated_at": "2023-05-30T14:00:00Z",
      "deleted_at": null
    }
  ];

  @override
  Future<List<PaymentMethodResponseModel>> getPaymentMethods() async {
    // const String url = '................';
    // final response = await _dio.get(url);

    return dummy.map((e) => PaymentMethodResponseModel.fromJson(e)).toList();
  }
}
