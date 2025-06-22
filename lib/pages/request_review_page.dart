import 'package:flutter/material.dart';

class RequestReviewPage extends StatefulWidget {
  @override
  _RequestReviewPageState createState() => _RequestReviewPageState();
}

class _RequestReviewPageState extends State<RequestReviewPage> {
  final List<Map<String, dynamic>> requests = [
    {
      'name': 'محمد كاشف',
      'amount': '300',
      'type': 'طلب أموال كاش',
      'status': 'بانتظار المراجعة'
    },
    {
      'name': 'علي عروس',
      'amount': '500',
      'type': 'طلب تحويل أموال',
      'status': 'بانتظار المراجعة'
    },
  ];

  void approveRequest(int index) {
    setState(() {
      requests[index]['status'] = 'تمت الموافقة';
    });
  }

  void rejectRequest(int index) {
    setState(() {
      requests[index]['status'] = 'مرفوض';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مراجعة طلبات الأموال')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الفني: ${request['name']}'),
                  Text('النوع: ${request['type']}'),
                  Text('المبلغ: ${request['amount']} درهم'),
                  Text('الحالة: ${request['status']}',
                      style: TextStyle(
                        color: request['status'] == 'تمت الموافقة'
                            ? Colors.green
                            : request['status'] == 'مرفوض'
                                ? Colors.red
                                : Colors.orange,
                      )),
                  SizedBox(height: 10),
                  if (request['status'] == 'بانتظار المراجعة')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => approveRequest(index),
                          icon: Icon(Icons.check),
                          label: Text('موافقة'),
                          style: ElevatedButton.styleFrom(primary: Colors.green),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => rejectRequest(index),
                          icon: Icon(Icons.close),
                          label: Text('رفض'),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
