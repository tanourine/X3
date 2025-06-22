import 'package:flutter/material.dart';

class ExpenseInvoicePage extends StatefulWidget {
  @override
  _ExpenseInvoicePageState createState() => _ExpenseInvoicePageState();
}

class _ExpenseInvoicePageState extends State<ExpenseInvoicePage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void submitExpense() {
    if (amountController.text.isEmpty || detailsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى تعبئة جميع الحقول')),
      );
      return;
    }

    // تنفيذ رفع البيانات أو إرسالها إلى تليجرام
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم رفع فاتورة المصاريف')),
    );
    Navigator.pop(context);
  }

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
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
              controller: detailsController,
              decoration: InputDecoration(labelText: 'تفاصيل المصاريف'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'المبلغ'),
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
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
