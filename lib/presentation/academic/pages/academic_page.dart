import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';
import '../../common/widgets/app_list_tile.dart';
import 'classes_page.dart';
import 'reports_page.dart';
import 'attendance_page.dart';

class AcademicPage extends StatelessWidget {
  const AcademicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: AppStrings.academic),
      body: ListView(
        children: [
          AppCard(
            child: Column(
              children: [
                AppListTile(
                  leading: const Icon(Icons.class_rounded),
                  title: 'Kelas',
                  subtitle: 'Kelas umum, agama, dan ngaji',
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ClassesPage()),
                  ),
                ),
                const Divider(),
                AppListTile(
                  leading: const Icon(Icons.assignment_rounded),
                  title: 'Rapor',
                  subtitle: 'Rapor umum, agama, dan ngaji',
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ReportsPage()),
                  ),
                ),
                const Divider(),
                AppListTile(
                  leading: const Icon(Icons.how_to_reg_rounded),
                  title: 'Absensi',
                  subtitle: 'Hadir, izin, alfa',
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AttendancePage()),
                  ),
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
                Text(
                  'Ini demo UI. Nanti bisa ditambah fitur jadwal pelajaran, agenda ujian, dan unduh rapor PDF.',
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
