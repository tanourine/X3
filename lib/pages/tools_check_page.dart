import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ToolsCheckPage extends StatefulWidget {
  const ToolsCheckPage({super.key});
  @override
  _ToolsCheckPageState createState() => _ToolsCheckPageState();
}

class _ToolsCheckPageState extends State<ToolsCheckPage> {
  final _picker = ImagePicker();
  final List<Map<String, dynamic>> _tools = [
    {'name': 'مفك براغي', 'status': null, 'image': null},
    {'name': 'كماشة', 'status': null, 'image': null},
    {'name': 'متر قياس', 'status': null, 'image': null},
    {'name': 'مفتاح إنجليزي', 'status': null, 'image': null},
  ];

  Future<void> _pickImage(int i) async {
    final img = await _picker.pickImage(source: ImageSource.camera);
    if (img != null) setState(() => _tools[i]['image'] = File(img.path));
  }

  void _submit() {
    if (_tools.any((t) => t['status'] == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى فحص جميع الأدوات')));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إرسال التشييك')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تشييك العدة')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _tools.length,
        itemBuilder: (_, i) {
          final t = _tools[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ChoiceChip(
                        label: const Text('✅'),
                        selected: t['status']=='ok',
                        onSelected: (_) => setState(()=>t['status']='ok'),
                      ),
                      ChoiceChip(
                        label: const Text('⚠️'),
                        selected: t['status']=='maintenance',
                        onSelected: (_) => setState(()=>t['status']='maintenance'),
                      ),
                      ChoiceChip(
                        label: const Text('❌'),
                        selected: t['status']=='missing',
                        onSelected: (_) => setState(()=>t['status']='missing'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  t['image']!=null
                      ? Image.file(t['image'], height: 100)
                      : const Text('لم يتم اختيار صورة'),
                  TextButton.icon(
                    onPressed: () => _pickImage(i),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('التقاط صورة'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          onPressed: _submit,
          child: const Text('إرسال التشييك'),
        ),
      ),
    );
  }
}
