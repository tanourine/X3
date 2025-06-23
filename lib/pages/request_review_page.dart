import 'package:flutter/material.dart';

class RequestReviewPage extends StatefulWidget {
  const RequestReviewPage({super.key});
  @override
  _RequestReviewPageState createState() => _RequestReviewPageState();
}

class _RequestReviewPageState extends State<RequestReviewPage> {
  List<Map<String, String>> _reqs = [
    {'name':'محمد كاشف','type':'طلب أموال كاش','amount':'300','status':'بانتظار المراجعة'},
    {'name':'علي عروس','type':'طلب تحويل أموال','amount':'500','status':'بانتظار المراجعة'},
  ];

  void _update(int i, String s) => setState(()=>_reqs[i]['status']=s);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مراجعة طلبات الأموال')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _reqs.length,
        itemBuilder: (_, i) {
          final r=_reqs[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الفني: ${r['name']}'),
                  Text('النوع: ${r['type']}'),
                  Text('المبلغ: ${r['amount']}'),
                  Text(
                    'الحالة: ${r['status']}',
                    style: TextStyle(
                      color: r['status']=='تمت الموافقة'
                          ? Colors.green
                          : r['status']=='مرفوض'
                              ? Colors.red
                              : Colors.orange,
                    ),
                  ),
                  if (r['status']=='بانتظار المراجعة')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.check),
                          label: const Text('موافقة'),
                          onPressed: ()=>_update(i,'تمت الموافقة'),
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.close),
                          label: const Text('رفض'),
                          onPressed: ()=>_update(i,'مرفوض'),
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
