import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/mock/mock_student.dart';
import '../../../data/mock/mock_transactions.dart';
import '../../../data/mock/mock_attendance.dart';
import '../../../data/mock/mock_announcements.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final student = MockStudentData.student;

    final hadir = MockAttendanceData.count(AttendanceStatus.hadir);
    final izin = MockAttendanceData.count(AttendanceStatus.izin);
    final alfa = MockAttendanceData.count(AttendanceStatus.alfa);

    return AppScaffold(
      appBar: const AppTopBar(title: AppStrings.home),
      body: ListView(
        children: [
          // Greeting
          Text(
            '${AppStrings.greeting},',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: cs.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            student.guardianName,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),

          // Student Header Card (lebih clean)
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Avatar(name: student.name),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'NIS: ${student.nis}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: cs.onSurface.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        student.room,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: cs.onSurface.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _InfoChip(label: student.generalClass),
                          _InfoChip(label: student.religiousClass),
                          _InfoChip(label: student.quranClass),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Wallet-like Balance Card
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: cs.outline),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [cs.onSurface.withOpacity(0.06), cs.surface],
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo Santri',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurface.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  Formatters.currency(MockTransactionData.currentBalance),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => context.go('/app'), // demo
                        icon: const Icon(Icons.receipt_long_rounded, size: 18),
                        label: const Text('Riwayat'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add_rounded, size: 18),
                        label: const Text('Top Up'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Attendance summary (3 status)
          const SectionTitle(title: 'Ringkasan Absensi'),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _StatCard(title: 'Hadir', value: hadir.toString()),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatCard(title: 'Izin', value: izin.toString()),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatCard(title: 'Alfa', value: alfa.toString()),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Quick Actions
          const SectionTitle(title: 'Aksi Cepat'),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _QuickAction(
                  icon: Icons.assignment_rounded,
                  label: 'Rapor',
                  onTap: () => _goTab(context, 1),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _QuickAction(
                  icon: Icons.how_to_reg_rounded,
                  label: 'Absensi',
                  onTap: () => _goTab(context, 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _QuickAction(
                  icon: Icons.account_balance_wallet_rounded,
                  label: 'Keuangan',
                  onTap: () => _goTab(context, 2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _QuickAction(
                  icon: Icons.campaign_rounded,
                  label: 'Pengumuman',
                  onTap: () => context.push('/announcements'), // optional
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          // Announcements (tap -> detail)
          SectionTitle(
            title: AppStrings.announcements,
            actionLabel: 'Lihat semua',
            onTap: () => context.push('/announcements'), // optional
          ),
          const SizedBox(height: 10),
          ...MockAnnouncementData.announcements
              .take(3)
              .map(
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: cs.onSurface.withOpacity(0.75),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Formatters.date(a.date),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: cs.onSurface.withOpacity(0.55),
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

  /// Demo: pindah tab tanpa nested router
  /// (untuk sekarang cukup arahkan user ke halaman /app lalu klik tab)
  void _goTab(BuildContext context, int tabIndex) {
    // Untuk versi demo cepat: arahkan ke /app dulu.
    // Kalau kamu mau bisa beneran loncat tab, kita buat state management untuk BottomNavShell.
    context.go('/app');
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
      width: 54,
      height: 54,
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

class _InfoChip extends StatelessWidget {
  final String label;
  const _InfoChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: cs.outline),
        color: cs.onSurface.withOpacity(0.03),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: cs.onSurface.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outline),
        color: cs.onSurface.withOpacity(0.03),
      ),
      child: Column(
        children: [
          Text(value, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: cs.onSurface.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: cs.outline),
          color: cs.surface,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: cs.onSurface.withOpacity(0.06),
                border: Border.all(color: cs.outline),
              ),
              child: Icon(icon, size: 20, color: cs.onSurface),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: cs.onSurface.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
