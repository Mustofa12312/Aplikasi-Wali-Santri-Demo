import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/formatters.dart';
import '../../../data/mock/mock_transactions.dart';
import '../../common/widgets/app_card.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/app_topbar.dart';
import '../../common/widgets/empty_state.dart';

class TransactionDetailPage extends StatelessWidget {
  final String id;
  const TransactionDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final tx = MockTransactionData.transactions.where((t) => t.id == id).isEmpty
        ? null
        : MockTransactionData.transactions.firstWhere((t) => t.id == id);

    return AppScaffold(
      appBar: const AppTopBar(title: 'Detail Transaksi', showBack: true),
      body: tx == null
          ? const EmptyState(message: 'Transaksi tidak ditemukan')
          : ListView(
              children: [
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 10),
                      _KeyValueRow(label: 'ID', value: tx.id),
                      const SizedBox(height: 8),
                      _KeyValueRow(
                        label: 'Tanggal',
                        value: Formatters.date(tx.date),
                      ),
                      const SizedBox(height: 8),
                      _KeyValueRow(
                        label: 'Jenis',
                        value: tx.type == TransactionType.income
                            ? 'Masuk'
                            : 'Keluar',
                      ),
                      const SizedBox(height: 8),
                      Divider(color: cs.outline),
                      const SizedBox(height: 10),
                      _KeyValueRow(
                        label: 'Nominal',
                        value: Formatters.currency(tx.amount),
                        strong: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Catatan',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ini tampilan demo UI. Nanti bisa ditambah detail seperti metode pembayaran, admin, bukti transaksi, dan status.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: cs.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _KeyValueRow extends StatelessWidget {
  final String label;
  final String value;
  final bool strong;

  const _KeyValueRow({
    required this.label,
    required this.value,
    this.strong = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
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
            style: strong
                ? Theme.of(context).textTheme.titleMedium
                : Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
