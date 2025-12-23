import 'dart:async';

class MockDelay {
  MockDelay._();

  /// Delay standar (dipakai di splash, refresh, dll)
  static Future<void> short() async {
    await Future.delayed(const Duration(milliseconds: 600));
  }

  static Future<void> medium() async {
    await Future.delayed(const Duration(milliseconds: 1200));
  }

  static Future<void> long() async {
    await Future.delayed(const Duration(milliseconds: 1800));
  }
}
