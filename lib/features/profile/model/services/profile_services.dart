import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  final Dio _dio = Dio();
  final String url = BaseURL.mock;

  Future<Map<String, dynamic>> fetchUserProfile() async {
    

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    try {
      final response = await _dio.get(
        '$url/user',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(response.data);
        return userData;
      } else {
        throw Exception('Failed to fetch user profile');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
  Future<void> updateUserProfile(String fullName, String email, String username, String phoneNumber, String profilePhotoUrl) async {
    try {
      final formData = FormData.fromMap({
        'FullName': fullName,
        'Email': email,
        'Username': username,
        'PhoneNumber': phoneNumber,
        'ProfilePhotoUrl': await MultipartFile.fromFile(profilePhotoUrl),
      });

      final response = await _dio.put('$url/user/profile', data: formData);

      if (response.statusCode == 200) {
        // Berhasil mengupdate profil
        print('Profil berhasil diperbarui');
      } else {
        // Gagal mengupdate profil
        print('Gagal memperbarui profil');
      }
    } catch (error) {
      // Error saat melakukan request
      print('Terjadi kesalahan: $error');
    }
  }
}
