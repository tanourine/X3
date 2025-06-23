import 'package:flutter/material.dart';
import '../warning_banner.dart';

class IncomeInvoicePage extends StatefulWidget {
  const IncomeInvoicePage({super.key});
  @override
  _IncomeInvoicePageState createState() => _IncomeInvoicePageState();
}

class _IncomeInvoicePageState extends State<IncomeInvoicePage> {
  final _clientCtrl = TextEditingController();
  final _invoiceCtrl = TextEditingController();
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
    if (_clientCtrl.text.isEmpty ||
        _invoiceCtrl.text.isEmpty ||
        _amountCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى إدخال جميع الحقول')));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم رفع فاتورة الدخل')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('رفع فاتورة دخل')),
      body: Column(
        children: [
          const IncomeWarningBanner(
            technicianName: 'محمد كاشف',
            showWarning: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  TextField(
                    controller: _clientCtrl,
                    decoration:
                        const InputDecoration(labelText: 'اسم العميل'),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _invoiceCtrl,
                    decoration:
                        const InputDecoration(labelText: 'رقم الفاتورة'),
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
          ),
        ],
      ),
    );
  }
}
