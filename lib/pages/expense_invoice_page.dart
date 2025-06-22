import 'package:flutter/material.dart';

class ExpenseInvoicePage extends StatefulWidget {
  @override
  _ExpenseInvoicePageState createState() => _ExpenseInvoicePageState();
}

class _ExpenseInvoicePageState extends State<ExpenseInvoicePage> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  void submitExpense() {
    if (descriptionController.text.isEmpty || amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى تعبئة كل الحقول')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم رفع فاتورة المصاريف بنجاح')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('رفع فاتورة مصاريف')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'وصف المصروف', border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'المبلغ', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            ListTile(
              title: Text("التاريخ: ${selectedDate.toLocal()}".split(' ')[0]),
              trailing: Icon(Icons.calendar_today),
              onTap: pickDate,
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: submitExpense,
              child: Text('إرسال'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
