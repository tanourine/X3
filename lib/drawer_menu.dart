import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final String userType; // 'مدير' أو 'فني'
  final void Function(String) onItemSelected;

  const DrawerMenu({
    super.key,
    required this.userType,
    required this.onItemSelected,
  });

  ListTile _item(BuildContext ctx, String title, String route) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.right),
      onTap: () {
        Navigator.pop(ctx);
        onItemSelected(route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                'تنورين للتكييف',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          _item(context, 'الرئيسية', '/home'),
          _item(context, 'رفع فاتورة دخل', '/income'),
          _item(context, 'رفع فاتورة مصاريف', '/expense'),
          _item(context, 'طلب أموال', '/request-money'),
          _item(context, 'تشييك العدة', '/tools-check'),
          if (userType == 'مدير') ...[
            _item(context, 'مراجعة طلبات الأموال', '/money-review'),
            _item(context, 'توليد ملفات Excel', '/excel-export'),
            _item(context, 'تحميل صور الأدوات', '/admin-tools'),
            _item(context, 'تتبع المواقع', '/location-tracking'),
          ],
        ],
      ),
    );
  }
}
