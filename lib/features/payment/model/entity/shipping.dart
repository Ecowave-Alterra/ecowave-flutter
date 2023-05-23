import 'package:ecowave/core/extensions/date_time_ext.dart';

class Shipping {
  final String name;
  final DateTime estimateFrom;
  final DateTime estimateComing;
  final int price;

  Shipping({
    required this.name,
    required this.estimateFrom,
    required this.estimateComing,
    required this.price,
  });

  String get estimate =>
      "(Diterima ${estimateFrom.toFormattedMonth()} - ${estimateComing.toFormattedMonth()})";
}
