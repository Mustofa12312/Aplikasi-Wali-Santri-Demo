// lib/presentation/announcements/pages/announcements_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/mock/mock_announcements.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';
import '../../common/widgets/empty_state.dart';
import '../../common/widgets/section_title.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = MockAnnouncementData.announcements;

    return AppScaffold(
      appBar: const AppTopBar(title: AppStrings.announcements, showBack: true),
      body: ListView(
        children: [
          const SectionTitle(title: 'Terbaru'),
          const SizedBox(height: 10),
          if (items.isEmpty)
            const SizedBox(
              height: 260,
              child: EmptyState(message: AppStrings.emptyData),
            )
          else
            ...items.map(
              (a) => AppCard(
                onTap: () => context.push('/announcement/${a.id}'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      a.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      a.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      Formatters.date(a.date),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
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
