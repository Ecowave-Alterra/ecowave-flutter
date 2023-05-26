import 'package:ecowave/core.dart';

class VoucherEntity {
  final String name;
  final double discount;
  final DateTime expiredDate;
  final String imageUrl;
  final String termCondition;
  final String type;

  VoucherEntity({
    required this.name,
    required this.discount,
    required this.expiredDate,
    required this.imageUrl,
    required this.termCondition,
    required this.type,
  });

  String get expiredDateFormatString => expiredDate.toFormattedDate();
}
