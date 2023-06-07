import 'dart:convert';
import 'package:ecowave/features/profile/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_model.dart';

class LoginService {
  List<Map<String, dynamic>> loginList = [
    {
      "email": "john@example.com",
      "password": "password123",
      "name": "John Doe",
      "age": 30
    },
    {
      "email": "jane@example.com",
      "password": "password456",
      "name": "Jane Smith",
      "age": 25
    },
    {
      "email": "bob@example.com",
      "password": "password789",
      "name": "Bob Johnson",
      "age": 40
    },
  ];

  Future<String> login(Login loginData) async {
    print("ok");

    Map<String, dynamic>? user = loginList.firstWhere(
      (element) =>
          element["email"] == loginData.email &&
          element["password"] == loginData.password,
    );
    print(user);
    if (user != []) {
      return "Login Gagal";
    } else {
      String token =
          base64Encode(utf8.encode('${loginData.email}:${loginData.password}'));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      print(token);
      return token;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
