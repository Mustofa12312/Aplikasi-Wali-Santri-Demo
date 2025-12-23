// lib/presentation/announcements/pages/announcement_detail_page.dart
import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../data/mock/mock_announcements.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';
import '../../common/widgets/empty_state.dart';

class AnnouncementDetailPage extends StatelessWidget {
  final String id;
  const AnnouncementDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final item =
        MockAnnouncementData.announcements.where((e) => e.id == id).isEmpty
        ? null
        : MockAnnouncementData.announcements.firstWhere((e) => e.id == id);

    return AppScaffold(
      appBar: const AppTopBar(title: 'Detail Pengumuman', showBack: true),
      body: item == null
          ? const EmptyState(message: 'Pengumuman tidak ditemukan')
          : ListView(
              children: [
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Formatters.date(item.date),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        item.content,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Catatan',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ini demo UI. Nanti bisa ditambah lampiran file, gambar, dan notifikasi pengumuman.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
