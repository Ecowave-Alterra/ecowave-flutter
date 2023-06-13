import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/address/model/models/address_request.dart';

class AddressService {
  late Dio _dio;
  AddressService() {
    _dio = Dio();
  }

  Future<List<AddressModel>> getAddresses() async {
    try {
      const String url = '${BaseURL.mock}user/address';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List datas = jsonDecode(response.data)["Data"];
        return datas
            .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw "get addresses not successfully";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createAddresses(AddressRequest request) async {
    try {
      const String url = '${BaseURL.mock}user/address';
      final response = await _dio.post(url, data: request.toJson());

      if (response.statusCode == 200) {
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
      final String url = '${BaseURL.mock}user/address/$id';
      final response = await _dio.put(url, data: request.toJson());

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
