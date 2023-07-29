import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/change_password/model/models/change_password_model.dart';
import 'package:flutter/material.dart';

class ChangePasswordService {
  final Dio _dio = Dio();

  Future<bool> changePassword(ChangePasswordModel request) async {
    try {
      const String url = '${BaseURL.api}/user/change-password';
      final response = await _dio.putUri(Uri.parse(url),
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
          data: request.toJson());

      debugPrint("RESPONSESESE : $response");
      if (response.statusCode == 200) {
        return true;
      } else {
        throw "change password not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
