import 'package:flutter/material.dart';

import '../../../data/mock/mock_attendance.dart';
import '../../../core/utils/formatters.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';
import '../widgets/attendance_summary_card.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final hadir = MockAttendanceData.count(AttendanceStatus.hadir);
    final izin = MockAttendanceData.count(AttendanceStatus.izin);
    final alfa = MockAttendanceData.count(AttendanceStatus.alfa);

    return AppScaffold(
      appBar: const AppTopBar(title: 'Absensi', showBack: true),
      body: ListView(
        children: [
          AttendanceSummaryCard(hadir: hadir, izin: izin, alfa: alfa),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Riwayat',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                ...MockAttendanceData.records.map((r) {
                  final label = r.status == AttendanceStatus.hadir
                      ? 'Hadir'
                      : r.status == AttendanceStatus.izin
                          ? 'Izin'
                          : 'Alfa';

                  final icon = r.status == AttendanceStatus.hadir
                      ? Icons.check_circle_rounded
                      : r.status == AttendanceStatus.izin
                          ? Icons.info_rounded
                          : Icons.cancel_rounded;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Icon(icon, color: cs.onSurface.withOpacity(0.7)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(Formatters.date(r.date)),
                        ),
                        Text(
                          label,
                          style: TextStyle(
                            color: cs.onSurface.withOpacity(0.7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
