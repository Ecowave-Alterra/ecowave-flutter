import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/auth/model/models/register_model.dart';

class RegisterService {
  static const String baseUrl =BaseURL.mock;

  final Dio dio = Dio();

  Future<bool> Register(RegisterModel user) async {
    try {

       await dio.post(
        '$baseUrl/users',
        data: user.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
       return true;
      // Tambahkan logika untuk menangani respons di sini
    } catch (e) {
      // Tangani kesalahan yang terjadi
      print('Error: $e');
       return false;
    }
  }


}
