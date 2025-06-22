import 'package:flutter/material.dart';

class ExcelExportPage extends StatefulWidget {
  @override
  _ExcelExportPageState createState() => _ExcelExportPageState();
}

class _ExcelExportPageState extends State<ExcelExportPage> {
  String selectedTechnician = 'محمد كاشف';
  String selectedMonth = 'يونيو 2025';

  final List<String> technicians = [
    'محمد كاشف',
    'علي عروس',
    'فني جديد 1',
    'فني جديد 2',
  ];

  final List<String> months = [
    'يناير 2025',
    'فبراير 2025',
    'مارس 2025',
    'أبريل 2025',
    'مايو 2025',
    'يونيو 2025',
  ];

  void generateExcel() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم توليد ملف Excel وإرساله إلى قناة التليجرام')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('توليد ملفات Excel')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedTechnician,
              items: technicians
                  .map((tech) => DropdownMenuItem(
                        value: tech,
                        child: Text(tech),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => selectedTechnician = value!),
              decoration: InputDecoration(labelText: 'اختر الفني'),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedMonth,
              items: months
                  .map((month) => DropdownMenuItem(
                        value: month,
                        child: Text(month),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => selectedMonth = value!),
              decoration: InputDecoration(labelText: 'اختر الشهر'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: generateExcel,
              child: Text('توليد الملف'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            )
          ],
        ),
      ),
    );
  }
}
