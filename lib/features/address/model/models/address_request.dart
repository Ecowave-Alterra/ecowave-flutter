import 'dart:convert';

class AddressRequest {
  final String recipient;
  final String phoneNumber;
  final int provinceId;
  final String provinceName;
  final int cityId;
  final String cityName;
  final String address;
  final String? note;
  final String? mark;
  final bool isPrimary;

  AddressRequest({
    required this.recipient,
    required this.phoneNumber,
    required this.provinceId,
    required this.provinceName,
    required this.cityId,
    required this.cityName,
    required this.address,
    this.note,
    this.mark,
    this.isPrimary = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'recipient': recipient,
      'phone': phoneNumber,
      'provinceId': provinceId.toString(),
      'provinceName': provinceName,
      'cityId': cityId.toString(),
      'cityName': cityName,
      'address': address,
      'note': note,
      'mark': mark,
      'isPrimary': isPrimary,
    };
  }

  String toJson() => json.encode(toMap());
}
