part of 'package:ecowave/core.dart';

extension DoubleExt on double {
  SizedBox get width => SizedBox(width: this);

  SizedBox get height => SizedBox(height: this);

  String get currencyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp',
        decimalDigits: 0,
      ).format(this);
}
