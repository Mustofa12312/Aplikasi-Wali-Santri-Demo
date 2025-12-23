// lib/presentation/profile/pages/settings_page.dart
import 'package:flutter/material.dart';

import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_list_tile.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: 'Pengaturan', showBack: true),
      body: ListView(
        children: [
          AppCard(
            child: Column(
              children: [
                AppListTile(
                  leading: const Icon(Icons.color_lens_rounded),
                  title: 'Tema',
                  subtitle: 'Monokrom minimalis (default)',
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(),
                AppListTile(
                  leading: const Icon(Icons.help_rounded),
                  title: 'Bantuan',
                  subtitle: 'Kontak admin pondok (coming soon)',
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(),
                AppListTile(
                  leading: const Icon(Icons.verified_rounded),
                  title: 'Versi',
                  subtitle: '1.0.0 (UI Demo)',
                  trailing: const SizedBox(width: 1),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Catatan', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Pengaturan ini masih UI-only. Nanti bisa ditambah ganti password, ganti akun, dan preferensi notifikasi.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
