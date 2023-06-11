import 'dart:convert';

class AddressRequest {
  final String recipient;
  final String phoneNumber;
  final String address;
  final String? note;
  final String? mark;
  final bool isPrimary;

  AddressRequest({
    required this.recipient,
    required this.phoneNumber,
    required this.address,
    this.note,
    this.mark,
    this.isPrimary = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'recipient': recipient,
      'phoneNumber': phoneNumber,
      'address': address,
      'note': note,
      'mark': mark,
      'isPrimary': isPrimary,
    };
  }

  String toJson() => json.encode(toMap());
}
