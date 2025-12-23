import 'package:flutter/material.dart';
import '../../../data/mock/mock_reports.dart';

class ReportSubjectTile extends StatelessWidget {
  final MockReportSubject subject;

  const ReportSubjectTile({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              subject.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: cs.outline),
              color: cs.onSurface.withOpacity(0.03),
            ),
            child: Text(
              subject.score.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
