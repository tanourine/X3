import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ToolsCheckPage extends StatefulWidget {
  @override
  _ToolsCheckPageState createState() => _ToolsCheckPageState();
}

class _ToolsCheckPageState extends State<ToolsCheckPage> {
  final List<Map<String, dynamic>> tools = [
    {'name': 'مفك براغي', 'status': null, 'image': null},
    {'name': 'كماشة', 'status': null, 'image': null},
    {'name': 'متر قياس', 'status': null, 'image': null},
    {'name': 'مفتاح إنجليزي', 'status': null, 'image': null},
  ];
  final picker = ImagePicker();

  Future<void> pickImage(int idx) async {
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) setState(() => tools[idx]['image'] = File(picked.path));
  }

  void submitCheck() {
    if (tools.any((t) => t['status'] == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى فحص جميع الأدوات')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إرسال تشييك العدة')),
    );
    Navigator.pop(context);
  }

  Widget statusChips(int idx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ChoiceChip(
          label: Text('✅'),
          selected: tools[idx]['status'] == 'ok',
          onSelected: (_) => setState(() => tools[idx]['status'] = 'ok'),
        ),
        ChoiceChip(
          label: Text('⚠️'),
          selected: tools[idx]['status'] == 'maintenance',
          onSelected: (_) => setState(() => tools[idx]['status'] = 'maintenance'),
        ),
        ChoiceChip(
          label: Text('❌'),
          selected: tools[idx]['status'] == 'missing',
          onSelected: (_) => setState(() => tools[idx]['status'] = 'missing'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تشييك العدة')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tools.length,
        itemBuilder: (ctx, idx) {
          final t = tools[idx];
          return Card(
            margin: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  statusChips(idx),
                  SizedBox(height: 10),
                  t['image'] != null
                      ? Image.file(File(t['image']), height: 100)
                      : Text('لم يتم اختيار صورة'),
                  TextButton.icon(
                    onPressed: () => pickImage(idx),
                    icon: Icon(Icons.camera_alt),
                    label: Text('التقاط صورة'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: submitCheck,
          child: Text('إرسال التشييك'),
          style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
        ),
      ),
    );
  }
}
