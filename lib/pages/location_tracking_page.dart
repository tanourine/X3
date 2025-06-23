import 'package:flutter/material.dart';

class LocationTrackingPage extends StatefulWidget {
  const LocationTrackingPage({super.key});
  @override
  _LocationTrackingPageState createState() => _LocationTrackingPageState();
}

class _LocationTrackingPageState extends State<LocationTrackingPage> {
  String _tech = 'محمد كاشف';
  String _date = '2025-06-20';

  final List<String> _techs = ['محمد كاشف','علي عروس'];
  final List<Map<String,String>> _locs = [
    {'time':'09:00','loc':'المنطقة الصناعية'},
    {'time':'11:30','loc':'الهيلي'},
    {'time':'14:15','loc':'زاخر'},
  ];

  void _showMap(String place) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('عرض $place على الخريطة')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تتبع المواقع')),
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
            TextFormField(
              initialValue: _date,
              decoration: const InputDecoration(labelText:'التاريخ (YYYY-MM-DD)'),
              onChanged: (v) => _date = v,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _locs.length,
                itemBuilder: (_, i) {
                  final e = _locs[i];
                  return ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(e['loc']!),
                    subtitle: Text('الوقت: ${e['time']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.map),
                      onPressed: ()=>_showMap(e['loc']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
