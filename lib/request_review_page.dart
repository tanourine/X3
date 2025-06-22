import 'package:flutter/material.dart';

class RequestReviewPage extends StatefulWidget {
  @override
  _RequestReviewPageState createState() => _RequestReviewPageState();
}

class _RequestReviewPageState extends State<RequestReviewPage> {
  final List<Map<String, String>> requests = [
    {'name': 'محمد كاشف', 'type': 'طلب أموال كاش', 'amount': '300', 'status': 'بانتظار المراجعة'},
    {'name': 'علي عروس', 'type': 'طلب تحويل أموال', 'amount': '500', 'status': 'بانتظار المراجعة'},
  ];

  void updateStatus(int i, String newStatus) {
    setState(() => requests[i]['status'] = newStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مراجعة طلبات الأموال')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: requests.length,
        itemBuilder: (ctx, i) {
          final r = requests[i];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الفني: ${r['name']}'),
                  Text('النوع: ${r['type']}'),
                  Text('المبلغ: ${r['amount']} درهم'),
                  Text('الحالة: ${r['status']}',
                      style: TextStyle(
                        color: r['status'] == 'تمت الموافقة'
                            ? Colors.green
                            : r['status'] == 'مرفوض'
                                ? Colors.red
                                : Colors.orange,
                      )),
                  if (r['status'] == 'بانتظار المراجعة')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => updateStatus(i, 'تمت الموافقة'),
                          icon: Icon(Icons.check),
                          label: Text('موافقة'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => updateStatus(i, 'مرفوض'),
                          icon: Icon(Icons.close),
                          label: Text('رفض'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
