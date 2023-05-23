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
  String toFormattedMonth() {
    final int day = this.day;
    final String month = _monthNames[this.month - 1];

    return '$day $month';
  }
}
