import 'dart:convert';

class ExpeditionRequest {
  final String cityId;
  final int weight;

  ExpeditionRequest({
    required this.cityId,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'cityId': cityId,
      'weight': weight,
    };
  }

  String toJson() => json.encode(toMap());
}
