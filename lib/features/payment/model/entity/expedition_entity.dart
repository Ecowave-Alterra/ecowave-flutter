import 'package:ecowave/core.dart';

class ExpeditionEntity {
  final String name;
  final DateTime estimateFrom;
  final DateTime estimateComing;
  final int price;

  ExpeditionEntity({
    required this.name,
    required this.estimateFrom,
    required this.estimateComing,
    required this.price,
  });

  String get estimate =>
      "(Diterima ${estimateFrom.toFormattedMonth()} - ${estimateComing.toFormattedMonth()})";
}
