import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/auth/model/models/register_model.dart';

class RegisterService {
  static const String baseUrl = BaseURL.api;

  final Dio dio = Dio();

  Future<bool> register(RegisterModel user) async {
    try {
      await dio.post(
        '$baseUrl/user/register',
        data: user.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
