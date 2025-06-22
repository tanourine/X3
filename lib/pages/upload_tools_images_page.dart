import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminToolsUploadPage extends StatefulWidget {
  @override
  _AdminToolsUploadPageState createState() => _AdminToolsUploadPageState();
}

class _AdminToolsUploadPageState extends State<AdminToolsUploadPage> {
  List<Map<String, dynamic>> toolList = [];
  final TextEditingController toolNameController = TextEditingController();
  final picker = ImagePicker();

  Future<void> pickImageForTool(int index) async {
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        toolList[index]['image'] = File(picked.path);
      });
    }
  }

  void addNewTool() {
    if (toolNameController.text.trim().isEmpty) return;
    setState(() {
      toolList.add({
        'name': toolNameController.text.trim(),
        'image': null,
      });
      toolNameController.clear();
    });
  }

  void uploadTools() {
    // عملية الإرسال إلى تيليجرام (تمثيليًا)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم تحميل الأدوات بنجاح')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تحميل أدوات العدة')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: toolNameController,
              decoration: InputDecoration(
                labelText: 'اسم الأداة',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addNewTool,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: toolList.length,
                itemBuilder: (context, index) {
                  final tool = toolList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(tool['name']),
                      subtitle: tool['image'] == null
                          ? Text('لم يتم اختيار صورة')
                          : Image.file(tool['image'], height: 60),
                      trailing: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () => pickImageForTool(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: uploadTools,
              child: Text('تحميل'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
