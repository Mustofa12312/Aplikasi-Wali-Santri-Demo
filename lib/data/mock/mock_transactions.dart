enum TransactionType { income, expense }

class MockTransaction {
  final String id;
  final String title;
  final DateTime date;
  final int amount;
  final TransactionType type;

  const MockTransaction({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
  });
}

class MockTransactionData {
  static const int currentBalance = 1250000;

  static final List<MockTransaction> transactions = [
    MockTransaction(
      id: 'TRX-001',
      title: 'Top Up Saldo',
      date: DateTime(2025, 9, 1),
      amount: 900000,
      type: TransactionType.income,
    ),
    MockTransaction(
      id: 'TRX-001',
      title: 'Top Up Saldo',
      date: DateTime(2025, 9, 1),
      amount: 800000,
      type: TransactionType.income,
    ),
    MockTransaction(
      id: 'TRX-001',
      title: 'Top Up Saldo',
      date: DateTime(2025, 9, 1),
      amount: 700000,
      type: TransactionType.income,
    ),
    MockTransaction(
      id: 'TRX-001',
      title: 'Top Up Saldo',
      date: DateTime(2025, 9, 1),
      amount: 500000,
      type: TransactionType.income,
    ),
    MockTransaction(
      id: 'TRX-002',
      title: 'SPP Bulanan',
      date: DateTime(2025, 9, 3),
      amount: 350000,
      type: TransactionType.expense,
    ),
    MockTransaction(
      id: 'TRX-003',
      title: 'Kantin',
      date: DateTime(2025, 9, 6),
      amount: 45000,
      type: TransactionType.expense,
    ),
    MockTransaction(
      id: 'TRX-004',
      title: 'Laundry',
      date: DateTime(2025, 9, 8),
      amount: 25000,
      type: TransactionType.expense,
    ),
    MockTransaction(
      id: 'TRX-005',
      title: 'Top Up Saldo',
      date: DateTime(2025, 9, 10),
      amount: 300000,
      type: TransactionType.income,
    ),
  ];
}
