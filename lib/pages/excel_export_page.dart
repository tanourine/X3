import 'package:flutter/material.dart';

class ExcelExportPage extends StatefulWidget {
  @override
  _ExcelExportPageState createState() => _ExcelExportPageState();
}

class _ExcelExportPageState extends State<ExcelExportPage> {
  String selectedTech = 'محمد كاشف';
  String selectedMonth = 'يونيو 2025';

  final List<String> technicians = ['محمد كاشف', 'علي عروس'];
  final List<String> months = ['مايو 2025', 'يونيو 2025', 'يوليو 2025'];

  void generate() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم توليد ملف Excel وإرساله')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('توليد ملفات Excel')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedTech,
              items: technicians.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              decoration: InputDecoration(labelText: 'اختر الفني'),
              onChanged: (v) => setState(() => selectedTech = v!),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedMonth,
              items: months.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
              decoration: InputDecoration(labelText: 'اختر الشهر'),
              onChanged: (v) => setState(() => selectedMonth = v!),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: generate,
              child: Text('توليد ملف'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
