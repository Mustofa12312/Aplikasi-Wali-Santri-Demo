import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../data/mock/mock_student.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  int _tab = 0; // 0 umum, 1 agama, 2 ngaji

  @override
  Widget build(BuildContext context) {
    final student = MockStudentData.student;

    final title = _tab == 0
        ? AppStrings.generalClass
        : _tab == 1
        ? AppStrings.religiousClass
        : AppStrings.quranClass;

    final classValue = _tab == 0
        ? student.generalClass
        : _tab == 1
        ? student.religiousClass
        : student.quranClass;

    return AppScaffold(
      appBar: const AppTopBar(title: 'Kelas', showBack: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Segmented(
            index: _tab,
            labels: const [
              AppStrings.generalClass,
              AppStrings.religiousClass,
              AppStrings.quranClass,
            ],
            onChanged: (i) => setState(() => _tab = i),
          ),
          const SizedBox(height: 16),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  classValue,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Text(
                  'Wali/Ustadz: (dummy)',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  'Jadwal: (dummy)',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Info', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  '• Kelas dapat berubah sesuai kebijakan pondok.\n'
                  '• Nanti bisa ditambah jadwal detail dan nama pengajar.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Segmented control minimalis (tanpa package)
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
