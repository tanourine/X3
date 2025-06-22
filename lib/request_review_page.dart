import 'package:flutter/material.dart';

class RequestReviewPage extends StatefulWidget {
  const RequestReviewPage({Key? key}) : super(key: key);

  @override
  State<RequestReviewPage> createState() => _RequestReviewPageState();
}

class _RequestReviewPageState extends State<RequestReviewPage> {
  final List<Map<String, String>> requests = [
    {
      'name': 'محمد كاشف',
      'amount': '300',
      'type': 'طلب أموال كاش',
      'status': 'بانتظار المراجعة',
    },
    {
      'name': 'علي عروس',
      'amount': '500',
      'type': 'طلب تحويل أموال',
      'status': 'بانتظار المراجعة',
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
      appBar: AppBar(
        title: const Text('مراجعة طلبات الأموال'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final req = requests[index];
          final status = req['status']!;
          Color statusColor;
          if (status == 'تمت الموافقة') {
            statusColor = Colors.green;
          } else if (status == 'مرفوض') {
            statusColor = Colors.red;
          } else {
            statusColor = Colors.orange;
          }
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الفني: ${req['name']}'),
                  Text('النوع: ${req['type']}'),
                  Text('المبلغ: ${req['amount']} درهم'),
                  Text(
                    'الحالة: $status',
                    style: TextStyle(color: statusColor),
                  ),
                  const SizedBox(height: 10),
                  if (status == 'بانتظار المراجعة')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => approveRequest(index),
                          icon: const Icon(Icons.check),
                          label: const Text('موافقة'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => rejectRequest(index),
                          icon: const Icon(Icons.close),
                          label: const Text('رفض'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
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
