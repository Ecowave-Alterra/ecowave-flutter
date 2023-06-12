import 'package:dio/dio.dart';
import 'package:ecowave/features/auth/model/models/register_model.dart';

class RegisterService {
  static const String baseUrl = 'https://a6855c2e-9a93-4072-b204-d5b98fb5ddfa.mock.pstmn.io';

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
