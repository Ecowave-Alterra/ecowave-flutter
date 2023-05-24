part of 'package:ecowave/core.dart';

final List<String> _monthNames = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember'
];

extension DateTimeExt on DateTime {
  String toFormattedDate() {
    final int day = this.day;
    final String month = _monthNames[this.month - 1];
    final int year = this.year;

    return '$day $month $year';
  }
}
