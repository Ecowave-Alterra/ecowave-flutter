import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/models/transaction_model.dart';
import 'package:ecowave/features/payment/model/models/transaction_request.dart';

class TransactionService {
  late Dio _dio;
  TransactionService() {
    _dio = Dio();
  }

  Future<String> getPaymentStatus(String id) async {
    try {
      final String url =
          '${BaseURL.mock}user/transaction/status-payment?id=$id';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return response.data["Payment Status"];
      } else {
        throw "get provinces not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TransactionModel> createTransaction(TransactionRequest request) async {
    try {
      const String url = '${BaseURL.mock}user/transaction';
      final response = await _dio.post(url, data: request.toJson());

      if (response.statusCode == 200) {
        return TransactionModel.fromJson(response.data);
      } else {
        throw "get provinces not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}