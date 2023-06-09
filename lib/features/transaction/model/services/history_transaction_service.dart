import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/model/models/rating_data_model.dart';
import 'package:ecowave/features/transaction/model/models/tracking_delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryTransactionService {
  late Dio _dio;
  late SharedPreferences prefs;
  late String token;
  HistoryTransactionService() {
    init();
  }

  Future<void> init() async {
    _dio = Dio();
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
  }

  Future<List<HistoryTransactionModel>?> getTransactions(String filter) async {
    try {
      String url = '${BaseURL.api}user/order?filter=$filter&page=1';
      final Response response = await _dio.getUri(
        Uri.parse(url),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        if (response.data["Order"].runtimeType == String) {
          return null;
        } else {
          final List<dynamic> datas =
              (response.data as Map<String, dynamic>)["Order"];
          List<HistoryTransactionModel> data = datas
              .map((x) =>
                  HistoryTransactionModel.fromJson(x as Map<String, dynamic>))
              .toList();
          return data;
        }
      } else {
        throw Exception('Failed to fetch transactions');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postCancelTransaction(String transactionId) async {
    try {
      final data = {
        'CanceledReason': "Dibatalkan Otomatis",
        'TransactionId': transactionId,
      };
      final response = await _dio.postUri(
        (Uri.parse('${BaseURL.api}user/order/cancel')),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        debugPrint("Berhasil membatalkan pesanan otomatis");
      }

      getTransactions("Dibatalkan");
    } catch (e) {
      throw Exception('An error occuaaaarred');
    }
  }

  Future<void> postCancelTransactionComment(
      String canceledReason, String transactionId) async {
    try {
      final data = {
        'CanceledReason': canceledReason,
        'TransactionId': transactionId,
      };

      final response = await _dio.postUri(
        (Uri.parse('${BaseURL.api}user/order/cancel')),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        debugPrint("Berhasil membatalkan pesanan dengan komentar");
      }

      getTransactions("Dibatalkan");
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  Future<void> confirmTransaction(String transactionId) async {
    try {
      final response =
          await _dio.postUri(Uri.parse('${BaseURL.api}user/order/confirm'),
              options: Options(
                headers: {"Authorization": "Bearer $token"},
              ),
              data: {'TransactionId': transactionId});
      if (response.statusCode == 200) {
        // print("Berhasil mengkonfirmasi pesanan");
      }
      getTransactions("Selesai");
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  Future<bool> postRatingData(List<RatingData> ratingDataList,
      double expeditionRating, String transactionId) async {
    try {
      FormData formData = FormData();

      formData.fields
          .add(MapEntry('ExpeditionRating', expeditionRating.toString()));

      for (int i = 0; i < ratingDataList.length; i++) {
        RatingData ratingData = ratingDataList[i];

        formData.fields.addAll([
          MapEntry(
              'RatingProduct${i + 1}', ratingData.ratingProduct.toString()),
          MapEntry('Comment${i + 1}', ratingData.comment),
        ]);

        formData.files.addAll([
          if (ratingData.photoUrl != '')
            MapEntry(
              'PhotoUrl${i + 1}',
              await MultipartFile.fromFile(ratingData.photoUrl),
            ),
          if (ratingData.videoUrl != '')
            MapEntry(
              'VideoUrl${i + 1}',
              await MultipartFile.fromFile(ratingData.videoUrl),
            ),
        ]);
      }
      Response response = await _dio.postUri(
        Uri.parse('${BaseURL.api}user/review/$transactionId'),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        data: formData,
      );

      debugPrint("Respond dari rating $response");

      if (response.statusCode == 201) {
        debugPrint('Data rating berhasil dikirim');
        return true;
      } else {
        throw "Gagak memberikan rating";
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<TrackingDeliveryModel>?> getTrackingDelivery(
      String resi, String cou) async {
    try {
      String url = '${BaseURL.api}/user/order/tracking?no=$resi&cou=$cou';
      final Response response = await _dio.getUri(
        Uri.parse(url),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        if (response.data["Tracking"]["data"]["history"] == null) {
          return null;
        } else {
          final List datas = (response.data as Map<String, dynamic>)["Tracking"]
              ["data"]["history"];

          // print("datas : $datas");
          List<TrackingDeliveryModel> data = datas
              .map((x) =>
                  TrackingDeliveryModel.fromJson(x as Map<String, dynamic>))
              .toList();
          return data;
        }
      } else {
        throw Exception('Failed to fetch transactions');
      }
    } catch (e) {
      rethrow;
    }
  }
}
