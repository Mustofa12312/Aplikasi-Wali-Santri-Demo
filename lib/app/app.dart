import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme.dart';

class WaliSantriApp extends StatelessWidget {
  const WaliSantriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Wali Santri',

      // ✅ Locale Indonesia (konsisten dengan intl)
      locale: const Locale('id', 'ID'),

      theme: AppTheme.light(),
      routerConfig: AppRouter.router,
    );
  }
}
