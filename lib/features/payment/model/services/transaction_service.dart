import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/models/transaction_model.dart';
import 'package:ecowave/features/payment/model/models/transaction_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionService {
  late Dio _dio;
  late SharedPreferences prefs;
  late String token;

  Future<void> init() async {
    _dio = Dio();
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
  }

  TransactionService() {
    init();
  }

  Future<String> getPaymentStatus(String id) async {
    try {
      final String url = '${BaseURL.api}user/transaction/status-payment?id=$id';
      final response = await _dio.getUri(
        Uri.parse(url),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return response.data["Payment Status"];
      } else {
        throw "get payment status not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TransactionModel> createTransaction(TransactionRequest request) async {
    try {
      const String url = '${BaseURL.api}user/transaction';
      final response = await _dio.postUri(
        Uri.parse(url),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return TransactionModel.fromJson(response.data);
      } else {
        throw "create transaction not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
