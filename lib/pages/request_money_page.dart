import 'package:flutter/material.dart';

class RequestMoneyPage extends StatefulWidget {
  const RequestMoneyPage({super.key});
  @override
  _RequestMoneyPageState createState() => _RequestMoneyPageState();
}

class _RequestMoneyPageState extends State<RequestMoneyPage> {
  String _type = 'طلب أموال كاش';
  final List<String> _options = [
    'طلب أموال كاش',
    'طلب سحب من بطاقة البنك',
    'طلب تحويل أموال إلى بطاقة بنك علي عروس',
    'طلب دفع فاتورة',
  ];
  final _amountCtrl = TextEditingController();
  final _reasonCtrl = TextEditingController();

  void _submit() {
    if (_amountCtrl.text.isEmpty || _reasonCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى تعبئة جميع الحقول')));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إرسال الطلب')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلب أموال')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              value: _type,
              decoration:
                  const InputDecoration(labelText: 'نوع الطلب'),
              items: _options
                  .map((o) => DropdownMenuItem(value: o, child: Text(o)))
                  .toList(),
              onChanged: (v) => setState(() => _type = v!),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _amountCtrl,
              decoration: const InputDecoration(labelText: 'المبلغ'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _reasonCtrl,
              decoration: const InputDecoration(labelText: 'السبب / ملاحظات'),
              maxLines: 3,
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
    );
  }
}
