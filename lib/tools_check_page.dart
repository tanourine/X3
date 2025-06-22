import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ToolsCheckPage extends StatefulWidget {
  const ToolsCheckPage({Key? key}) : super(key: key);

  @override
  State<ToolsCheckPage> createState() => _ToolsCheckPageState();
}

class _ToolsCheckPageState extends State<ToolsCheckPage> {
  final List<Map<String, dynamic>> tools = [
    {'name': 'مفك براغي',      'status': null, 'image': null},
    {'name': 'كماشة',          'status': null, 'image': null},
    {'name': 'متر قياس',       'status': null, 'image': null},
    {'name': 'مفتاح إنجليزي',  'status': null, 'image': null},
  ];

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(int index) async {
    final XFile? picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        // نخزن هنا كـ File لسهولة العرض لاحقاً
        tools[index]['image'] = File(picked.path);
      });
    }
  }

  void submitCheck() {
    final allChecked = tools.every((t) => t['status'] != null);
    if (!allChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى فحص جميع الأدوات')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إرسال تشييك العدة')),
    );
    Navigator.pop(context);
  }

  Widget statusSelector(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ChoiceChip(
          label: const Text('✅'),
          selected: tools[index]['status'] == 'ok',
          onSelected: (_) => setState(() => tools[index]['status'] = 'ok'),
        ),
        ChoiceChip(
          label: const Text('⚠️'),
          selected: tools[index]['status'] == 'needs_maintenance',
          onSelected: (_) =>
              setState(() => tools[index]['status'] = 'needs_maintenance'),
        ),
        ChoiceChip(
          label: const Text('❌'),
          selected: tools[index]['status'] == 'missing',
          onSelected: (_) => setState(() => tools[index]['status'] = 'missing'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تشييك العدة')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tools.length,
        itemBuilder: (context, index) {
          final tool = tools[index];
          final File? imageFile = tool['image'];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tool['name'],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  statusSelector(index),
                  const SizedBox(height: 10),
                  if (imageFile != null)
                    Image.file(imageFile, height: 100)
                  else
                    const Text('لم يتم اختيار صورة'),
                  TextButton.icon(
                    onPressed: () => pickImage(index),
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
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: submitCheck,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: const Text('إرسال التشييك'),
        ),
      ),
    );
  }
}
