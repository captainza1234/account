import 'package:flutter/foundation.dart';
import '../model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(title: 'หนังสือ', amount: 1000, date: DateTime.now()),
    Transaction(title: 'เสื้อยืด', amount: 200, date: DateTime.now()),
    Transaction(title: 'รองเท้า', amount: 1500, date: DateTime.now()),
    Transaction(title: 'กระเป๋า', amount: 1000, date: DateTime.now()),
    Transaction(title: 'KFC', amount: 300, date: DateTime.now()),
    Transaction(title: 'McDonald', amount: 200, date: DateTime.now()),
  ];

  List<Transaction> get transactions => _transactions;

  void addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(), // ✅ ใช้ DateTime.now()
    );

    _transactions.add(newTransaction);
    notifyListeners(); // ✅ แจ้งเตือน UI ให้อัปเดต
  }
}


