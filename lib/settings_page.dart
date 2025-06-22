import 'package:flutter/material.dart';

class ToolPurchaseRequestPage extends StatefulWidget {
  final String toolName;

  const ToolPurchaseRequestPage({Key? key, required this.toolName}) : super(key: key);

  @override
  _ToolPurchaseRequestPageState createState() => _ToolPurchaseRequestPageState();
}

class _ToolPurchaseRequestPageState extends State<ToolPurchaseRequestPage> {
  String reason = 'مفقودة';
  final TextEditingController noteController = TextEditingController();

  void submitRequest() {
    if (noteController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى كتابة ملاحظة أو سبب الطلب')),
      );
      return;
    }

    // إرسال الطلب إلى قسم الصيانة → ثم إلى المدير العام
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الأداة: ${widget.toolName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: reason,
              items: ['مفقودة', 'تحتاج صيانة']
                  .map((value) => DropdownMenuItem(child: Text(value), value: value))
                  .toList(),
              onChanged: (val) => setState(() => reason = val!),
              decoration: InputDecoration(labelText: 'سبب الطلب'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: noteController,
              decoration: InputDecoration(labelText: 'ملاحظات إضافية'),
              maxLines: 3,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: submitRequest,
              child: Text('إرسال الطلب'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            )
          ],
        ),
      ),
    );
  }
}
