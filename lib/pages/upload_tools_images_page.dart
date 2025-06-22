import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadToolsImagesPage extends StatefulWidget {
  @override
  _UploadToolsImagesPageState createState() => _UploadToolsImagesPageState();
}

class _UploadToolsImagesPageState extends State<UploadToolsImagesPage> {
  List<Map<String, dynamic>> tools = [];
  final nameCtrl = TextEditingController();
  final picker = ImagePicker();

  Future<void> pickImage(int i) async {
    final p = await picker.pickImage(source: ImageSource.camera);
    if (p != null) setState(() => tools[i]['image'] = File(p.path));
  }

  void addTool() {
    if (nameCtrl.text.trim().isEmpty) return;
    setState(() {
      tools.add({'name': nameCtrl.text.trim(), 'image': null});
      nameCtrl.clear();
    });
  }

  void uploadAll() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم تحميل صور الأدوات')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تحميل صور الأدوات')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(labelText: 'اسم الأداة'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: addTool, child: Text('إضافة أداة')),
            Divider(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: tools.length,
                itemBuilder: (_, i) {
                  final t = tools[i];
                  return ListTile(
                    title: Text(t['name']),
                    subtitle: t['image'] != null
                        ? Image.file(t['image'], height: 60)
                        : Text('لا توجد صورة'),
                    trailing: IconButton(icon: Icon(Icons.camera_alt), onPressed: () => pickImage(i)),
                  );
                },
              ),
            ),
            ElevatedButton(onPressed: uploadAll, child: Text('تحميل'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))),
          ],
        ),
      ),
    );
  }
}
