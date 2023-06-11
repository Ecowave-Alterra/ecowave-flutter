import 'package:dio/dio.dart';
import 'package:ecowave/features/auth/model/models/login_model.dart';


class LoginService {
 

  Future<int?> login(Login login) async {
    try {
      Dio dio = Dio();
      final response = await dio.post(
          'https://galonin.temanhorizon.com/api/login',
          data: login.toJson());

      print(response);
      if (response.data != null) {
        return response.data['data']['userId'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
