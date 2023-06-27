import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/address/model/models/address_request.dart';
import 'package:ecowave/features/address/model/models/city_model.dart';
import 'package:ecowave/features/address/model/models/province_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressService {
  late Dio _dio;
  late SharedPreferences prefs;
  late String token;

  Future<void> init() async {
    _dio = Dio();
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
  }

  AddressService() {
    init();
  }

  Future<List<ProvinceModel>> getProvinces() async {
    try {
      const String url = 'https://api.rajaongkir.com/starter/province';
      final response = await _dio.getUri(
        Uri.parse(url),
        options: Options(
          headers: {"key": "8bb5248063ed493d90aac0311f8a3edb"},
        ),
      );

      if (response.statusCode == 200) {
        final List datas = response.data["rajaongkir"]["results"];
        return datas.map((e) => ProvinceModel.fromJson(e)).toList();
      } else {
        throw "get provinces not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CityModel>> getCities(int provinceId) async {
    try {
      final String url =
          'https://api.rajaongkir.com/starter/city?province=$provinceId';
      final response = await _dio.getUri(
        Uri.parse(url),
        options: Options(
          headers: {"key": "8bb5248063ed493d90aac0311f8a3edb"},
        ),
      );

      if (response.statusCode == 200) {
        final List datas = response.data["rajaongkir"]["results"];
        return datas.map((e) => CityModel.fromJson(e)).toList();
      } else {
        throw "get cities not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AddressModel>> getAddresses() async {
    try {
      const String url = '${BaseURL.api}user/address';
      final response = await _dio.getUri(
        Uri.parse(url),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        final List datas = response.data["Data"];
        return datas.map((e) => AddressModel.fromJson(e)).toList();
      } else {
        throw "get addresses not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createAddresses(AddressRequest request) async {
    try {
      const String url = '${BaseURL.api}user/address';
      final response = await _dio.postUri(Uri.parse(url),
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          data: request.toJson());

      if (response.statusCode == 201) {
        return true;
      } else {
        throw "create address not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateAddresses(int id, AddressRequest request) async {
    try {
      final String url = '${BaseURL.api}user/address/$id';
      final response = await _dio.putUri(Uri.parse(url),
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          data: request.toJson());

      if (response.statusCode == 200) {
        return true;
      } else {
        throw "update address not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }
}
