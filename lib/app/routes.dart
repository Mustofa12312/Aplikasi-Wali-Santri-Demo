import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ✅ pages (pakai yang sudah kamu buat di presentation/)
import '../presentation/auth/pages/splash_page.dart';
import '../presentation/auth/pages/login_page.dart';

// ✅ bottom nav shell versi final (bukan placeholder)
import '../navigation/bottom_nav_shell.dart';

// ✅ detail pages
import '../presentation/finance/pages/transaction_detail_page.dart';
import '../presentation/announcements/pages/announcement_detail_page.dart';

// ✅ profile routes
import '../presentation/profile/pages/notifications_page.dart';
import '../presentation/profile/pages/settings_page.dart';

/// Router utama aplikasi (FIX)
/// - Tidak ada lagi Placeholder Splash/Login/BottomNav di file ini
/// - Semua pakai halaman beneran dari folder presentation/
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: <RouteBase>[
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/app',
        name: 'app',
        builder: (context, state) => const BottomNavShell(),
      ),

      // ✅ Route detail transaksi
      GoRoute(
        path: '/transaction/:id',
        name: 'transaction_detail',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return TransactionDetailPage(id: id);
        },
      ),

      // ✅ Route detail pengumuman
      GoRoute(
        path: '/announcement/:id',
        name: 'announcement_detail',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return AnnouncementDetailPage(id: id);
        },
      ),

      // ✅ Profile routes
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
