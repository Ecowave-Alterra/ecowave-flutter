import 'dart:convert';

List<TrackingDeliveryModel> trackingDeliveryModelFromJson(String str) =>
    List<TrackingDeliveryModel>.from(
        json.decode(str).map((x) => TrackingDeliveryModel.fromJson(x)));

String trackingDeliveryModelToJson(List<TrackingDeliveryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrackingDeliveryModel {
  final String date;
  final String desc;
  final String location;

  TrackingDeliveryModel({
    required this.date,
    required this.desc,
    required this.location,
  });

  factory TrackingDeliveryModel.fromJson(Map<String, dynamic> json) =>
      TrackingDeliveryModel(
        date: json["date"],
        desc: json["desc"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "desc": desc,
        "location": location,
      };
}
