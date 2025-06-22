import 'package:flutter/material.dart';

class RequestMoneyPage extends StatefulWidget {
  @override
  _RequestMoneyPageState createState() => _RequestMoneyPageState();
}

class _RequestMoneyPageState extends State<RequestMoneyPage> {
  String requestType = 'طلب أموال كاش';
  final TextEditingController amountController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  final List<String> requestOptions = [
    'طلب أموال كاش',
    'طلب سحب من بطاقة البنك',
    'طلب تحويل أموال إلى بطاقة بنك علي عروس',
    'طلب دفع فاتورة',
  ];

  void submitRequest() {
    if (amountController.text.isEmpty || reasonController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى تعبئة جميع الحقول')),
      );
      return;
    }

    // إرسال الطلب إلى المسؤول
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إرسال الطلب بنجاح')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('طلب أموال')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              value: requestType,
              items: requestOptions
                  .map((option) =>
                      DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  requestType = value!;
                });
              },
              decoration: InputDecoration(labelText: 'نوع الطلب'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'المبلغ'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(labelText: 'السبب / ملاحظات'),
              maxLines: 3,
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: submitRequest,
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
