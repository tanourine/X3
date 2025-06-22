import 'package:flutter/material.dart';

class ToolPurchaseRequestPage extends StatefulWidget {
  final String toolName;
  const ToolPurchaseRequestPage({Key? key, required this.toolName}) : super(key: key);

  @override
  _ToolPurchaseRequestPageState createState() => _ToolPurchaseRequestPageState();
}

class _ToolPurchaseRequestPageState extends State<ToolPurchaseRequestPage> {
  String reason = 'مفقودة';
  final noteCtrl = TextEditingController();

  void submit() {
    if (noteCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى كتابة سبب')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إرسال طلب الشراء')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('طلب شراء أداة')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('الأداة: ${widget.toolName}'),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: reason,
              items: ['مفقودة', 'تحتاج صيانة'].map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
              onChanged: (v) => setState(() => reason = v!),
              decoration: InputDecoration(labelText: 'السبب'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: noteCtrl,
              decoration: InputDecoration(labelText: 'ملاحظات إضافية'),
              maxLines: 3,
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: submit, child: Text('إرسال الطلب'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))),
          ],
        ),
      ),
    );
  }
}
