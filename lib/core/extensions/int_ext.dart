part of 'package:ecowave/core.dart';

extension StringExt on int {
  String get currencyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp',
        decimalDigits: 0,
      ).format(this);

  String get numberFormat => NumberFormat.currency(
        locale: 'id',
        symbol: '',
        decimalDigits: 0,
      ).format(this);

  String get currencyFormatSimpleRp {
    if (this >= 1000000) {
      double amount = this / 1000000;
      return 'Rp${amount.toStringAsFixed(0)}JT';
    } else if (this >= 1000) {
      double amount = this / 1000;
      return 'Rp${amount.toStringAsFixed(0)}RB';
    } else {
      return 'Rp$this';
    }
  }
}
