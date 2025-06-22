import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final Function(String) onItemSelected;

  const DrawerMenu({Key? key, required this.onItemSelected}) : super(key: key);

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
          _buildDrawerItem(context, 'الصفحة الرئيسية', '/home'),
          _buildDrawerItem(context, 'فاتورة دخل', '/income'),
          _buildDrawerItem(context, 'طلب أموال', '/request-money'),
          _buildDrawerItem(context, 'تشييك العدة', '/tools-check'),
          _buildDrawerItem(context, 'مراجعة الطلبات', '/money-review'),
          _buildDrawerItem(context, 'تصدير Excel', '/excel-export'),
          _buildDrawerItem(context, 'تنبيه الإيرادات', '/income-warning'),
          _buildDrawerItem(context, 'تحميل أدوات (المدير)', '/admin-tools'),
          _buildDrawerItem(context, 'تتبع المواقع', '/location-tracking'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.right),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
