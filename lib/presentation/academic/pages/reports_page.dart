import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../data/mock/mock_reports.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';
import '../widgets/report_subject_tile.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  int _tab = 0; // 0 ngaji, 1 umum, 2 agama

  @override
  Widget build(BuildContext context) {
    final type = _tab == 0
        ? ReportType.quran
        : _tab == 1
        ? ReportType.general
        : ReportType.religious;

    final report = MockReportData.reports.firstWhere((r) => r.type == type);

    final title = _tab == 0
        ? 'Rapor Ngaji'
        : _tab == 1
        ? 'Rapor Umum'
        : 'Rapor Agama';

    return AppScaffold(
      appBar: AppTopBar(title: title, showBack: true),
      body: ListView(
        children: [
          _Segmented(
            index: _tab,
            labels: const [
              AppStrings.quranClass,
              AppStrings.generalClass,
              AppStrings.religiousClass,
            ],
            onChanged: (i) => setState(() => _tab = i),
          ),
          const SizedBox(height: 16),

          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report.semester,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Rata-rata: ${report.subjects.isEmpty ? 0 : (report.subjects.map((e) => e.score).reduce((a, b) => a + b) / report.subjects.length).toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 8),

                // ✅ daftar mapel boleh panjang, aman karena outer-nya ListView
                ...report.subjects.map((s) => ReportSubjectTile(subject: s)),
              ],
            ),
          ),

          const SizedBox(height: 12),

          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Unduh', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text('Unduh PDF (coming soon)'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Segmented control minimalis
class _Segmented extends StatelessWidget {
  final int index;
  final List<String> labels;
  final ValueChanged<int> onChanged;

  const _Segmented({
    required this.index,
    required this.labels,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: cs.outline),
        borderRadius: BorderRadius.circular(16),
        color: cs.surface,
      ),
      child: Row(
        children: List.generate(labels.length, (i) {
          final selected = i == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: selected ? cs.onSurface : Colors.transparent,
                ),
                child: Text(
                  labels[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selected ? cs.surface : cs.onSurface,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
