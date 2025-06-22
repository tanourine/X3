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

  Future<void> pickImage(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        tools[index]['image'] = pickedFile.path;
      });
    }
  }

  void submitCheck() {
    bool allChecked = tools.every((tool) => tool['status'] != null);
    if (!allChecked) {
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

  Widget statusSelector(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ChoiceChip(
          label: Text('✅'),
          selected: tools[index]['status'] == 'ok',
          onSelected: (_) => setState(() => tools[index]['status'] = 'ok'),
        ),
        ChoiceChip(
          label: Text('⚠️'),
          selected: tools[index]['status'] == 'needs_maintenance',
          onSelected: (_) => setState(() => tools[index]['status'] = 'needs_maintenance'),
        ),
        ChoiceChip(
          label: Text('❌'),
          selected: tools[index]['status'] == 'missing',
          onSelected: (_) => setState(() => tools[index]['status'] = 'missing'),
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
        itemBuilder: (context, index) {
          final tool = tools[index];
          return Card(
            margin: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tool['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  statusSelector(index),
                  SizedBox(height: 10),
                  tool['image'] != null
                      ? Image.file(
                          File(tool['image']),
                          height: 100,
                        )
                      : Text('لم يتم اختيار صورة'),
                  TextButton.icon(
                    onPressed: () => pickImage(index),
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
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: submitCheck,
          child: Text('إرسال التشييك'),
          style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
        ),
      ),
    );
  }
}
