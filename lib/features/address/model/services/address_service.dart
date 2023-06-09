import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/address/model/models/address_request.dart';

class AddressService {
  // late Dio _dio;
  // AddressRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  Map<String, dynamic> dummy = {
    "Data": [
      {
        "UserAddress": 1,
        "Recipient": "ibu nadira",
        "PhoneNumber": "085123456789",
        "Address": "bantul",
        "Note": "rumah warna oren",
        "Mark": "Rumah",
        "IsPrimary": false,
        "UserId": 5
      },
      {
        "UserAddress": 2,
        "Recipient": "satpam kampus nadira",
        "PhoneNumber": "085123456789",
        "Address": "sleman",
        "Note": "titip ke satpam aja",
        "Mark": "Kantor",
        "IsPrimary": false,
        "UserId": 5
      },
      {
        "UserAddress": 5,
        "Recipient": "bapak nadira",
        "PhoneNumber": "085123456789",
        "Address": "bantul",
        "Note": "rumah warna oren",
        "Mark": "Rumah",
        "IsPrimary": true,
        "UserId": 5
      }
    ],
    "Message": "Alamat berhasil didapatkan",
    "Status": 200
  };

  Future<List<AddressModel>> getAddresses() async {
    try {
      // const String url = 'localhost:8080/user/address';
      // final response = await _dio.get(url);

      List<Map<String, dynamic>> datas = dummy["Data"];

      return datas.map((e) => AddressModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createAddresses(AddressRequest request) async {
    try {
      // const String url = 'localhost:8080/user/address';
      // final response = await _dio.post(url);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateAddresses(int id, AddressRequest request) async {
    try {
      // const String url = 'localhost:8080/user/address/$id';
      // final response = await _dio.put(url);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
