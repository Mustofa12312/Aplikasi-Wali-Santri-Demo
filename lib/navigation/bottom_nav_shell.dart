import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_strings.dart';
import '../presentation/home/pages/home_page.dart';
import '../presentation/academic/pages/academic_page.dart';
import '../presentation/finance/pages/finance_page.dart';
import '../presentation/profile/pages/profile_page.dart';

class BottomNavShell extends StatelessWidget {
  const BottomNavShell({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        // ✅ clean solid background
        backgroundColor: cs.surface,

        // ✅ hairline border (premium)
        border: Border(top: BorderSide(color: cs.outline)),

        // ✅ warna monokrom elegan
        activeColor: cs.onSurface,
        inactiveColor: cs.onSurface.withOpacity(0.45),

        // ✅ ikon lebih ringan
        iconSize: 22,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            activeIcon: Icon(CupertinoIcons.book_fill),
            label: AppStrings.academic,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.creditcard),
            activeIcon: Icon(CupertinoIcons.creditcard_fill),
            label: AppStrings.finance,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            activeIcon: Icon(CupertinoIcons.person_fill),
            label: AppStrings.profile,
          ),
        ],
      ),

      // ✅ tiap tab punya navigator sendiri (iOS native)
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (_) {
            return Container(
              color: cs.surface, // penting biar tidak abu iOS
              child: switch (index) {
                0 => const HomePage(),
                1 => const AcademicPage(),
                2 => const FinancePage(),
                _ => const ProfilePage(),
              },
            );
          },
        );
      },
    );
  }
}
