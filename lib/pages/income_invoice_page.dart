import 'package:flutter/material.dart';
import 'package:tanourine_app/warning_banner.dart';

class IncomeWarningBanner extends StatelessWidget {
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
        lastDate: DateTime(2100));
    if (d != null) setState(() => _date = d);
  }

  void _submit() {
    if (_clientCtrl.text.isEmpty ||
        _invoiceCtrl.text.isEmpty ||
        _amountCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('يرجى إدخال جميع الحقول')));
      return;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('تم رفع فاتورة الدخل')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('رفع فاتورة دخل')),
      body: Column(
        children: [
          IncomeWarningBanner(
            technicianName: 'محمد كاشف',
            showWarning: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  TextField(
                    controller: _clientCtrl,
                    decoration: InputDecoration(labelText: 'اسم العميل'),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _invoiceCtrl,
                    decoration: InputDecoration(labelText: 'رقم الفاتورة'),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _amountCtrl,
                    decoration: InputDecoration(labelText: 'المبلغ'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),
                  ListTile(
                    title:
                        Text('التاريخ: ${_date.toLocal()}'.split(' ')[0]),
                    trailing: Icon(Icons.calendar_today),
                    onTap: _pickDate,
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('إرسال'),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
