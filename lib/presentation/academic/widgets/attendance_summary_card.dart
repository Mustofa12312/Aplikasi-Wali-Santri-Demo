import 'package:flutter/material.dart';
import '../../common/widgets/app_card.dart';

class AttendanceSummaryCard extends StatelessWidget {
  final int hadir;
  final int izin;
  final int alfa;

  const AttendanceSummaryCard({
    super.key,
    required this.hadir,
    required this.izin,
    required this.alfa,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Expanded(child: _Item(label: 'Hadir', value: hadir.toString())),
          const SizedBox(width: 10),
          Expanded(child: _Item(label: 'Izin', value: izin.toString())),
          const SizedBox(width: 10),
          Expanded(child: _Item(label: 'Alfa', value: alfa.toString())),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String label;
  final String value;

  const _Item({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: cs.outline),
        color: cs.onSurface.withOpacity(0.03),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: cs.onSurface.withOpacity(0.65)),
          ),
        ],
      ),
    );
  }
}
