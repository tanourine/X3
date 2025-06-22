import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final String userType; // "مدير" أو "فني"
  final Function(String) onItemSelected;

  const DrawerMenu({
    Key? key,
    required this.userType,
    required this.onItemSelected,
  }) : super(key: key);

  Widget _buildItem(BuildContext ctx, String title, String route) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.right),
      onTap: () => onItemSelected(route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text('تنورين للتكييف',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
          ),
          _buildItem(context, 'الرئيسية', '/home'),
          _buildItem(context, 'رفع فاتورة دخل', '/income'),
          _buildItem(context, 'رفع فاتورة مصاريف', '/expense'),
          _buildItem(context, 'طلب أموال', '/request-money'),
          _buildItem(context, 'تشييك العدة', '/tools-check'),
          if (userType == 'مدير') ...[
            _buildItem(context, 'مراجعة طلبات الأموال', '/money-review'),
            _buildItem(context, 'توليد ملفات Excel', '/excel-export'),
            _buildItem(context, 'تحميل صور الأدوات', '/admin-tools'),
            _buildItem(context, 'تتبع المواقع', '/location-tracking'),
          ],
        ],
      ),
    );
  }
}
