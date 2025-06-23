import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadToolsImagesPage extends StatefulWidget {
  const UploadToolsImagesPage({super.key});
  @override
  _UploadToolsImagesPageState createState() => _UploadToolsImagesPageState();
}

class _UploadToolsImagesPageState extends State<UploadToolsImagesPage> {
  final _picker = ImagePicker();
  final _nameCtrl = TextEditingController();
  final List<Map<String, dynamic>> _tools = [];

  void _add() {
    if (_nameCtrl.text.trim().isEmpty) return;
    setState(() {
      _tools.add({'name': _nameCtrl.text.trim(), 'image': null});
      _nameCtrl.clear();
    });
  }

  Future<void> _pickImage(int i) async {
    final img = await _picker.pickImage(source: ImageSource.camera);
    if (img != null) setState(()=>_tools[i]['image']=File(img.path));
  }

  void _upload() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تحميل صور الأدوات')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تحميل صور الأدوات')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText:'اسم الأداة'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _add, child: const Text('إضافة أداة')),
            const Divider(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: _tools.length,
                itemBuilder: (_, i) {
                  final t = _tools[i];
                  return ListTile(
                    title: Text(t['name']),
                    subtitle: t['image']!=null
                        ? Image.file(t['image'], height: 60)
                        : const Text('لا توجد صورة'),
                    trailing: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: ()=>_pickImage(i),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              onPressed: _upload,
              child: const Text('تحميل'),
            ),
          ],
        ),
      ),
    );
  }
}
