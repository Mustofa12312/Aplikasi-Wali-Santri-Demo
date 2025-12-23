// lib/presentation/profile/pages/notifications_page.dart
import 'package:flutter/material.dart';

import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final items = [
      _Notif(
        title: 'Absensi',
        subtitle: 'Santri hadir hari ini',
        time: '07:10',
        icon: Icons.how_to_reg_rounded,
      ),
      _Notif(
        title: 'Transaksi',
        subtitle: 'Pengeluaran: Kantin Rp 45.000',
        time: '12:30',
        icon: Icons.account_balance_wallet_rounded,
      ),
      _Notif(
        title: 'Pengumuman',
        subtitle: 'Jadwal kegiatan Jumat malam setelah Isya',
        time: '19:05',
        icon: Icons.campaign_rounded,
      ),
    ];

    return AppScaffold(
      appBar: const AppTopBar(title: 'Notifikasi', showBack: true),
      body: ListView(
        children: [
          ...items.map(
            (n) => AppCard(
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: cs.outline),
                      color: cs.onSurface.withOpacity(0.06),
                    ),
                    child: Icon(n.icon, color: cs.onSurface, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          n.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          n.subtitle,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: cs.onSurface.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    n.time,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: cs.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Notif {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  _Notif({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });
}
