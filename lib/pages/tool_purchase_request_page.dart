import 'package:flutter/material.dart';

class ToolPurchaseRequestPage extends StatefulWidget {
  final String toolName;
  const ToolPurchaseRequestPage({super.key, required this.toolName});

  @override
  _ToolPurchaseRequestPageState createState() =>
      _ToolPurchaseRequestPageState();
}

class _ToolPurchaseRequestPageState extends State<ToolPurchaseRequestPage> {
  String _reason = 'مفقودة';
  final _noteCtrl = TextEditingController();

  void _submit() {
    if (_noteCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى كتابة سبب')));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إرسال طلب الشراء')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلب شراء أداة')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('الأداة: ${widget.toolName}'),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _reason,
              decoration: const InputDecoration(labelText: 'السبب'),
              items: ['مفقودة', 'تحتاج صيانة']
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
              onChanged: (v) => setState(() => _reason = v!),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _noteCtrl,
              decoration: const InputDecoration(labelText: 'ملاحظات إضافية'),
              maxLines: 3,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
              onPressed: _submit,
              child: const Text('إرسال الطلب'),
            ),
          ],
        ),
      ),
    );
  }
}
