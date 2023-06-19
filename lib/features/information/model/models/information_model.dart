// To parse this JSON data, do
//
//     final informationModel = informationModelFromJson(jsonString);

import 'dart:convert';

InformationModel informationModelFromJson(String str) =>
    InformationModel.fromJson(json.decode(str));

String informationModelToJson(InformationModel data) =>
    json.encode(data.toJson());

class InformationModel {
  final String informationId;
  final String title;
  final String photoContentUrl;
  final String content;
  final String date;

  InformationModel({
    required this.informationId,
    required this.title,
    required this.photoContentUrl,
    required this.content,
    required this.date,
  });

  factory InformationModel.fromJson(Map<String, dynamic> json) =>
      InformationModel(
        informationId: json["InformationId"],
        title: json["Title"],
        photoContentUrl: json["PhotoContentUrl"],
        content: json["Content"],
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "InformationId": informationId,
        "Title": title,
        "PhotoContentUrl": photoContentUrl,
        "Content": content,
        "Date": date,
      };
}
