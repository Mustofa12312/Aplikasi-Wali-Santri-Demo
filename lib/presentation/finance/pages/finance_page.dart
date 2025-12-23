import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/mock/mock_transactions.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';
import '../../common/widgets/chip_filter.dart';
import '../../common/widgets/empty_state.dart';
import '../../common/widgets/section_title.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  int _filterIndex = 0; // 0: semua, 1: masuk, 2: keluar

  List<MockTransaction> get _filtered {
    final all = [...MockTransactionData.transactions]
      ..sort((a, b) => b.date.compareTo(a.date));

    if (_filterIndex == 1) {
      return all.where((e) => e.type == TransactionType.income).toList();
    }
    if (_filterIndex == 2) {
      return all.where((e) => e.type == TransactionType.expense).toList();
    }
    return all;
  }

  int get _totalIncome => MockTransactionData.transactions
      .where((e) => e.type == TransactionType.income)
      .fold(0, (sum, e) => sum + e.amount);

  int get _totalExpense => MockTransactionData.transactions
      .where((e) => e.type == TransactionType.expense)
      .fold(0, (sum, e) => sum + e.amount);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final items = _filtered;

    return AppScaffold(
      appBar: const AppTopBar(title: AppStrings.finance),
      body: ListView(
        children: [
          // Wallet Card (lebih premium)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: cs.outline),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [cs.onSurface.withOpacity(0.07), cs.surface],
              ),
            ),
            padding: const EdgeInsets.all(18),
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
                const SizedBox(height: 14),

                // Ringkasan masuk/keluar
                Row(
                  children: [
                    Expanded(
                      child: _MiniStat(
                        label: 'Masuk',
                        value: Formatters.currency(_totalIncome),
                        icon: Icons.arrow_downward_rounded,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _MiniStat(
                        label: 'Keluar',
                        value: Formatters.currency(_totalExpense),
                        icon: Icons.arrow_upward_rounded,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // Actions
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add_rounded, size: 18),
                        label: const Text('Top Up'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_balance_rounded,
                          size: 18,
                        ),
                        label: const Text('Tarik'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Filter chips (scrollable biar rapi)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ChipFilter(
                  label: 'Semua',
                  selected: _filterIndex == 0,
                  onTap: () => setState(() => _filterIndex = 0),
                ),
                const SizedBox(width: 10),
                ChipFilter(
                  label: AppStrings.income,
                  selected: _filterIndex == 1,
                  onTap: () => setState(() => _filterIndex = 1),
                ),
                const SizedBox(width: 10),
                ChipFilter(
                  label: AppStrings.expense,
                  selected: _filterIndex == 2,
                  onTap: () => setState(() => _filterIndex = 2),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          const SectionTitle(title: AppStrings.transactions),
          const SizedBox(height: 8),

          if (items.isEmpty)
            const SizedBox(
              height: 240,
              child: EmptyState(message: AppStrings.emptyData),
            )
          else
            ..._buildGroupedList(context, items),
        ],
      ),
    );
  }

  List<Widget> _buildGroupedList(
    BuildContext context,
    List<MockTransaction> items,
  ) {
    final cs = Theme.of(context).colorScheme;

    // group by yyyy-mm-dd
    final Map<String, List<MockTransaction>> grouped = {};
    for (final t in items) {
      final key = '${t.date.year}-${t.date.month}-${t.date.day}';
      grouped.putIfAbsent(key, () => []).add(t);
    }

    final keys = grouped.keys.toList()
      ..sort((a, b) => b.compareTo(a)); // latest first

    final List<Widget> widgets = [];

    for (final k in keys) {
      final groupItems = grouped[k]!;
      final date = groupItems.first.date;

      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 6),
          child: Text(
            Formatters.date(date),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: cs.onSurface.withOpacity(0.6),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

      for (final t in groupItems) {
        widgets.add(
          AppCard(
            onTap: () => context.push('/transaction/${t.id}'),
            child: Row(
              children: [
                _TxIcon(type: t.type),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        t.type == TransactionType.income
                            ? 'Dana masuk'
                            : 'Pengeluaran',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: cs.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  _amountLabel(t),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: cs.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.chevron_right_rounded,
                  color: cs.onSurface.withOpacity(0.45),
                ),
              ],
            ),
          ),
        );
      }
    }

    return widgets;
  }

  String _amountLabel(MockTransaction t) {
    final sign = t.type == TransactionType.income ? '+' : '-';
    return '$sign${Formatters.currency(t.amount)}';
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _MiniStat({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outline),
        color: cs.onSurface.withOpacity(0.03),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cs.outline),
              color: cs.onSurface.withOpacity(0.06),
            ),
            child: Icon(icon, size: 18, color: cs.onSurface),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withOpacity(0.65),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TxIcon extends StatelessWidget {
  final TransactionType type;
  const _TxIcon({required this.type});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isIncome = type == TransactionType.income;

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: cs.onSurface.withOpacity(0.06),
        border: Border.all(color: cs.outline),
      ),
      child: Icon(
        isIncome ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
        color: cs.onSurface,
        size: 20,
      ),
    );
  }
}
