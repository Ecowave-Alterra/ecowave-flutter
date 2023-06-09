import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/auth/model/models/login_model.dart';

class LoginService {
  static const String baseUrl = BaseURL.api;

  final Dio dio = Dio();

  Future<Map<String, dynamic>> login(LoginModel model) async {
    try {
      final response = await dio.post(
        '$baseUrl/user/login',
        data: model.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return {
          'success': false,
          'message': 'Login failed',
          'data': null,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Error: $e',
        'data': null,
      };
    }
  }
}
