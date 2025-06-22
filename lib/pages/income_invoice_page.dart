import 'package:flutter/material.dart';

class IncomeInvoicePage extends StatefulWidget {
  @override
  _IncomeInvoicePageState createState() => _IncomeInvoicePageState();
}

class _IncomeInvoicePageState extends State<IncomeInvoicePage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController invoiceNumberController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void submitForm() {
    final amount = amountController.text;
    final client = clientNameController.text;
    final invoice = invoiceNumberController.text;

    if (amount.isNotEmpty && client.isNotEmpty && invoice.isNotEmpty) {
      // إرسال البيانات إلى قاعدة البيانات أو تليجرام
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم رفع فاتورة الدخل بنجاح')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى ملء جميع الحقول')),
      );
    }
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
      appBar: AppBar(title: Text('رفع فاتورة دخل')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: clientNameController,
              decoration: InputDecoration(labelText: 'اسم العميل'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: invoiceNumberController,
              decoration: InputDecoration(labelText: 'رقم الفاتورة'),
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
              onPressed: submitForm,
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
