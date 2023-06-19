import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/model/models/tracking_delivery_mode.dart';
import 'package:flutter/material.dart';

class HistoryTransactionService {
  late Dio _dio;
  HistoryTransactionService() {
    _dio = Dio();
  }

  Future<List<HistoryTransactionModel>> getTransactions(String filter) async {
    try {
      String url = '${BaseURL.mock}user/order?filter=$filter';
      final Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List datas = (response.data as Map<String, dynamic>)["Order"];
        // print("datas : $datas");
        List<HistoryTransactionModel> data = datas
            .map((x) =>
                HistoryTransactionModel.fromJson(x as Map<String, dynamic>))
            .toList();
        return data;
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
        'TransactionId': transactionId,
      };
      final response = await _dio.post(
        '${BaseURL.mock}user/order/cancel',
        data: data,
      );

      // print("ini response : $response");
      if (response.statusCode == 200) {
        // print("Berhasil membatalkan pesanan otomatis");
      }

      getTransactions("Dibatalkan");
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  Future<void> postCancelTransactionComment(
      String canceledReason, String transactionId) async {
    try {
      final data = {
        'CanceledReason': canceledReason,
        'TransactionId': transactionId,
      };
      final response = await _dio.post(
        '${BaseURL.mock}user/order/cancel',
        data: data,
      );
      if (response.statusCode == 200) {
        // print("Berhasil membatalkan pesanan dengan komentar");
      }

      getTransactions("Dibatalkan");
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  Future<void> confirmTransaction(String transactionId) async {
    try {
      final response = await _dio.post('${BaseURL.mock}user/order/confirm',
          data: {'TransactionId': transactionId});
      if (response.statusCode == 200) {
        // print("Berhasil mengkonfirmasi pesanan");
      }
      getTransactions("Selesai");
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  Future<void> postRatingData(
      List<RatingData> ratingDataList, double expeditionRating) async {
    try {
      FormData formData = FormData();

      formData.fields
          .add(MapEntry('ExpeditionRating', expeditionRating.toString()));

      for (int i = 0; i < ratingDataList.length; i++) {
        RatingData ratingData = ratingDataList[i];

        formData.fields.addAll([
          MapEntry(
              'RatingProduct${i + 1}', ratingData.ratingProduct.toString()),
          MapEntry('CommentUser${i + 1}', ratingData.commentUser),
        ]);

        formData.files.addAll([
          MapEntry(
            'PhotoUrl${i + 1}',
            await MultipartFile.fromFile(ratingData.photoUrl,
                filename: 'photo$i'),
          ),
          MapEntry(
            'VideoUrl${i + 1}',
            await MultipartFile.fromFile(ratingData.videoUrl,
                filename: 'video$i'),
          ),
        ]);
      }

      Response response = await _dio.post(
        '${BaseURL.mock}user/reviews',
        data: formData,
      );

      if (response.statusCode == 200) {
        debugPrint('Data rating berhasil dikirim');
        getTransactions("Selesai");
      } else {
        debugPrint(
            'Gagal mengirim data rating. Status code: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Terjadi error saat mengirim data rating: $error');
    }
  }

  Future<List<TrackingDeliveryModel>> getTrackingDelivery(
      String resi, String cou) async {
    try {
      String url = '${BaseURL.mock}/user/order/tracking?no=$resi&cou=$cou';
      final Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List datas = (response.data as Map<String, dynamic>)["Tracking"]
            ["data"]["history"];
        // print("datas : $datas");
        List<TrackingDeliveryModel> data = datas
            .map((x) =>
                TrackingDeliveryModel.fromJson(x as Map<String, dynamic>))
            .toList();
        return data;
      } else {
        throw Exception('Failed to fetch transactions');
      }
    } catch (e) {
      rethrow;
    }
  }
}

class RatingData {
  final double ratingProduct;
  final String photoUrl;
  final String videoUrl;
  final String commentUser;

  RatingData({
    required this.ratingProduct,
    required this.photoUrl,
    required this.videoUrl,
    required this.commentUser,
  });
}
