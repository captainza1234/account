class Transaction {
  final String title;
  final double amount;
  final DateTime date; // ใช้ DateTime แทน String

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
  });
}
