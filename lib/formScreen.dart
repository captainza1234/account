import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/transactionProvider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text) ?? 0;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    Provider.of<TransactionProvider>(context, listen: false)
        .addTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop(); // ปิดหน้าฟอร์ม
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เพิ่มรายการธุรกรรม')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'ชื่อรายการ'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'จำนวนเงิน'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('บันทึก'),
            ),
          ],
        ),
      ),
    );
  }
}
