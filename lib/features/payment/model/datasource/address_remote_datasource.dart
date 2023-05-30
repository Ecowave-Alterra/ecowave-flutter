import 'package:ecowave/features/payment/model/response/address_response_model.dart';

abstract class AddressRemoteDatasource {
  Future<List<AddressResponseModel>> getAddresses();
}

class AddressRemoteDatasourceImpl implements AddressRemoteDatasource {
  // late Dio _dio;
  // AddressRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "id": 1,
      "user_id": 123,
      "recipient": "John Doe",
      "phone": "1234567890",
      "address": "123 Main Street",
      "note": "Apartment 4B",
      "mark": "Rumah",
      "is_primary": false,
      "created_at": "2023-05-30T10:00:00Z",
      "updated_at": "2023-05-30T10:00:00Z",
      "deleted_at": null
    },
    {
      "id": 2,
      "user_id": 456,
      "recipient": "Jane Smith",
      "phone": "9876543210",
      "address": "456 Elm Avenue",
      "note": "",
      "mark": "Kantor",
      "is_primary": true,
      "created_at": "2023-05-30T11:00:00Z",
      "updated_at": "2023-05-30T11:00:00Z",
      "deleted_at": null
    },
    {
      "id": 3,
      "user_id": 789,
      "recipient": "Sarah Johnson",
      "phone": "5551234567",
      "address": "789 Oak Street",
      "note": "",
      "mark": "Corner House",
      "is_primary": false,
      "created_at": "2023-05-30T12:00:00Z",
      "updated_at": "2023-05-30T12:00:00Z",
      "deleted_at": null
    },
    {
      "id": 4,
      "user_id": 123,
      "recipient": "Michael Brown",
      "phone": "5559876543",
      "address": "456 Pine Lane",
      "note": "Unit 8",
      "mark": "Rumah",
      "is_primary": false,
      "created_at": "2023-05-30T13:00:00Z",
      "updated_at": "2023-05-30T13:00:00Z",
      "deleted_at": null
    },
    {
      "id": 5,
      "user_id": 789,
      "recipient": "Emily Davis",
      "phone": "5551112222",
      "address": "321 Cedar Road",
      "note": "",
      "mark": "Apartment Complex",
      "is_primary": false,
      "created_at": "2023-05-30T14:00:00Z",
      "updated_at": "2023-05-30T14:00:00Z",
      "deleted_at": null
    },
  ];

  @override
  Future<List<AddressResponseModel>> getAddresses() async {
    // const String url = '................';
    // final response = await _dio.get(url);

    List<AddressResponseModel> data = [];

    for (Map<String, dynamic> item in dummy) {
      data.add(AddressResponseModel.fromJson(item));
    }

    return data;
  }
}
