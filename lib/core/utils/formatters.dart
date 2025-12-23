import 'package:intl/intl.dart';

class Formatters {
  Formatters._();

  /// Format Rupiah: Rp 150.000
  static String currency(num value) {
    final f = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return f.format(value);
  }

  /// Format tanggal: 12 Sep 2025
  static String date(DateTime date) {
    return DateFormat('dd MMM yyyy', 'id_ID').format(date);
  }

  /// Format jam: 08:30
  static String time(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  /// Singkat nama panjang → cocok buat card kecil
  static String shortName(String name, {int max = 12}) {
    if (name.length <= max) return name;
    return '${name.substring(0, max)}…';
  }
}
