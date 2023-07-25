import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';

class ChangePasswordService {
  static const String baseUrl = BaseURL.api;

  final Dio dio = Dio();

  Future<Map<String, dynamic>> sendEmailOtp(String email) async {
    try {
      final response = await dio.post(
        '$baseUrl/user/forgot-password',
        data: {"Email": email},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw "Gagal mengirim OTP";
      }
    } catch (e) {
      throw Exception('An error occurred $e');
    }
  }

  Future<Map<String, dynamic>> verifikasiOtp(String email, String otp) async {
    try {
      final response = await dio.post(
        '$baseUrl/user/verifikasi-otp',
        data: {"Email": email, "CodeOtp": otp},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw "Gagal verifikasi OTP";
      }
    } catch (e) {
      throw Exception('An error occurred $e');
    }
  }
}
