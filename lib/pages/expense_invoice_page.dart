import 'package:flutter/material.dart';

class ExpenseInvoicePage extends StatefulWidget {
  const ExpenseInvoicePage({super.key});
  @override
  _ExpenseInvoicePageState createState() => _ExpenseInvoicePageState();
}

class _ExpenseInvoicePageState extends State<ExpenseInvoicePage> {
  final _descCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  DateTime _date = DateTime.now();

  Future<void> _pickDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (d != null) setState(() => _date = d);
  }

  void _submit() {
    if (_descCtrl.text.isEmpty || _amountCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى تعبئة كل الحقول')));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم رفع فاتورة المصاريف')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('رفع فاتورة مصاريف')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _descCtrl,
              decoration:
                  const InputDecoration(labelText: 'وصف المصروف'),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _amountCtrl,
              decoration: const InputDecoration(labelText: 'المبلغ'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            ListTile(
              title: Text('التاريخ: ${_date.toLocal()}'.split(' ')[0]),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
              child: const Text('إرسال'),
            ),
          ],
        ),
      ),
    );
  }
}
