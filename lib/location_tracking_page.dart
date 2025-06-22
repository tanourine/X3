import 'package:flutter/material.dart';

class LocationTrackingPage extends StatefulWidget {
  @override
  _LocationTrackingPageState createState() => _LocationTrackingPageState();
}

class _LocationTrackingPageState extends State<LocationTrackingPage> {
  String selectedTechnician = 'محمد كاشف';
  String selectedDate = '2025-06-20';

  final List<String> technicians = [
    'محمد كاشف',
    'علي عروس',
    'فني جديد 1',
    'فني جديد 2',
  ];

  final List<Map<String, String>> locations = [
    {'time': '09:00', 'location': 'منطقة الصناعية'},
    {'time': '11:30', 'location': 'الهيلي'},
    {'time': '14:15', 'location': 'زاخر'},
  ];

  void showOnMap(String location) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('عرض الموقع: $location (تمثيلي فقط)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تتبع المواقع')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedTechnician,
              items: technicians
                  .map((tech) => DropdownMenuItem(value: tech, child: Text(tech)))
                  .toList(),
              onChanged: (val) => setState(() => selectedTechnician = val!),
              decoration: InputDecoration(labelText: 'اختر الفني'),
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: selectedDate,
              decoration: InputDecoration(labelText: 'التاريخ (YYYY-MM-DD)'),
              onChanged: (val) => selectedDate = val,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  final loc = locations[index];
                  return ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(loc['location']!),
                    subtitle: Text('الوقت: ${loc['time']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.map),
                      onPressed: () => showOnMap(loc['location']!),
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
