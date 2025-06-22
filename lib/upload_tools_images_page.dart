import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadToolsImagesPage extends StatefulWidget {
  const UploadToolsImagesPage({Key? key}) : super(key: key);

  @override
  State<UploadToolsImagesPage> createState() => _UploadToolsImagesPageState();
}

class _UploadToolsImagesPageState extends State<UploadToolsImagesPage> {
  final List<Map<String, dynamic>> toolList = [];
  final TextEditingController toolNameController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  @override
  void dispose() {
    toolNameController.dispose();
    super.dispose();
  }

  Future<void> pickImageForTool(int index) async {
    final XFile? picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        toolList[index]['image'] = File(picked.path);
      });
    }
  }

  void addNewTool() {
    final name = toolNameController.text.trim();
    if (name.isEmpty) return;
    setState(() {
      toolList.add({'name': name, 'image': null});
      toolNameController.clear();
    });
  }

  void uploadTools() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم تحميل الأدوات بنجاح')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تحميل أدوات العدة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: toolNameController,
              decoration: InputDecoration(
                labelText: 'اسم الأداة',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addNewTool,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: toolList.length,
                itemBuilder: (context, index) {
                  final tool = toolList[index];
                  final File? image = tool['image'];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(tool['name']),
                      subtitle: image == null
                          ? const Text('لم يتم اختيار صورة')
                          : Image.file(image, height: 60),
                      trailing: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () => pickImageForTool(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: uploadTools,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const Text('تحميل'),
            ),
          ],
        ),
      ),
    );
  }
}
