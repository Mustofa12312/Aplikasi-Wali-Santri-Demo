// lib/presentation/profile/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../../../data/mock/mock_student.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_list_tile.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final student = MockStudentData.student;

    return AppScaffold(
      appBar: const AppTopBar(title: AppStrings.profile),
      body: ListView(
        children: [
          AppCard(
            child: Row(
              children: [
                _Avatar(name: student.guardianName),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.guardianName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Wali dari: ${student.name}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              children: [
                AppListTile(
                  leading: const Icon(Icons.badge_rounded),
                  title: 'Profil Santri',
                  subtitle: '${student.nis} • ${student.room}',
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => _showStudentSheet(context),
                ),
                const Divider(),
                AppListTile(
                  leading: const Icon(Icons.notifications_rounded),
                  title: 'Notifikasi',
                  subtitle: 'Pengumuman, absensi, transaksi',
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push('/notifications'),
                ),
                const Divider(),
                AppListTile(
                  leading: const Icon(Icons.settings_rounded),
                  title: 'Pengaturan',
                  subtitle: 'Tema, bantuan, versi aplikasi',
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push('/settings'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tentang', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Versi demo UI. Backend dan fitur real bisa dikembangkan setelah ini.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showStudentSheet(BuildContext context) {
    final student = MockStudentData.student;
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profil Santri',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 14),
                _KV(label: 'Nama', value: student.name),
                _KV(label: 'NIS', value: student.nis),
                _KV(label: 'Asrama', value: student.room),
                _KV(label: 'Kelas Umum', value: student.generalClass),
                _KV(label: 'Kelas Agama', value: student.religiousClass),
                _KV(label: 'Halaqah', value: student.quranClass),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Avatar extends StatelessWidget {
  final String name;
  const _Avatar({required this.name});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final initial = name.trim().isEmpty ? '?' : name.trim()[0].toUpperCase();

    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cs.outline),
        color: cs.onSurface.withOpacity(0.06),
      ),
      child: Center(
        child: Text(initial, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

class _KV extends StatelessWidget {
  final String label;
  final String value;
  const _KV({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: cs.onSurface.withOpacity(0.65),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
