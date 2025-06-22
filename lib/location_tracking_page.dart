import 'package:flutter/material.dart';

class LocationTrackingPage extends StatefulWidget {
  @override
  _LocationTrackingPageState createState() => _LocationTrackingPageState();
}

class _LocationTrackingPageState extends State<LocationTrackingPage> {
  String selectedTech = 'محمد كاشف';
  String selectedDate = '2025-06-20';

  final List<String> techs = ['محمد كاشف', 'علي عروس'];
  final List<Map<String, String>> locs = [
    {'time': '09:00', 'loc': 'المنطقة الصناعية'},
    {'time': '11:30', 'loc': 'الهيلي'},
    {'time': '14:15', 'loc': 'زاخر'},
  ];

  void showMap(String place) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('عرض $place على الخريطة')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تتبع المواقع')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedTech,
              items: techs.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              decoration: InputDecoration(labelText: 'اختر الفني'),
              onChanged: (v) => setState(() => selectedTech = v!),
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: selectedDate,
              decoration: InputDecoration(labelText: 'التاريخ (YYYY-MM-DD)'),
              onChanged: (v) => selectedDate = v,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: locs.length,
                itemBuilder: (_, i) {
                  final e = locs[i];
                  return ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(e['loc']!),
                    subtitle: Text('الوقت: ${e['time']}'),
                    trailing: IconButton(icon: Icon(Icons.map), onPressed: () => showMap(e['loc']!)),
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
