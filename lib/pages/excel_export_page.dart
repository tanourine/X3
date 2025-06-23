import 'package:flutter/material.dart';

class ExcelExportPage extends StatefulWidget {
  const ExcelExportPage({super.key});
  @override
  _ExcelExportPageState createState() => _ExcelExportPageState();
}

class _ExcelExportPageState extends State<ExcelExportPage> {
  String _tech = 'محمد كاشف';
  String _month = 'يونيو 2025';

  final List<String> _techs = ['محمد كاشف','علي عروس'];
  final List<String> _months = ['مايو 2025','يونيو 2025','يوليو 2025'];

  void _generate() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم توليد ملف Excel')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('توليد ملفات Excel')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _tech,
              decoration: const InputDecoration(labelText:'اختر الفني'),
              items: _techs.map((t)=>DropdownMenuItem(value:t,child:Text(t))).toList(),
              onChanged:(v)=>setState(()=>_tech=v!),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _month,
              decoration: const InputDecoration(labelText:'اختر الشهر'),
              items: _months.map((m)=>DropdownMenuItem(value:m,child:Text(m))).toList(),
              onChanged:(v)=>setState(()=>_month=v!),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              onPressed: _generate,
              child: const Text('توليد ملف'),
            ),
          ],
        ),
      ),
    );
  }
}
