import 'package:ecowave/core.dart';

class ExpeditionModel {
  final String code;
  final String name;
  final String description;
  final int price;
  final int estimate;

  ExpeditionModel({
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.estimate,
  });

  DateTime get _estimateFrom => DateTime.now();
  DateTime get _estimateComing => _estimateFrom.add(Duration(days: estimate));

  String get estimateFormat =>
      "(Diterima ${_estimateFrom.toFormattedMonth()} - ${_estimateComing.toFormattedMonth()})";
}
