enum TransactionType { income, expense }

class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final int amount;
  final TransactionType type;

  const Transaction({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
  });

  bool get isIncome => type == TransactionType.income;
  bool get isExpense => type == TransactionType.expense;
}
