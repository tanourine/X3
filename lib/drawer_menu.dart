import 'package:flutter/material.dart';
import 'income_invoice_page.dart';
import 'request_money_page.dart';
import 'tools_check_page.dart';
import 'request_review_page.dart';
import 'excel_export_page.dart';
import 'warning_banner.dart';
import 'upload_tools_images_page.dart';
import 'location_tracking_page.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  'تنورين للتكييف',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            _drawerItem(context, 'فاتورة دخل', '/income'),
            _drawerItem(context, 'طلب أموال', '/request-money'),
            _drawerItem(context, 'تشييك العدة', '/tools-check'),
            _drawerItem(context, 'مراجعة الطلبات', '/money-review'),
            _drawerItem(context, 'تصدير Excel', '/excel-export'),
            _drawerItem(context, 'تنبيه الإيرادات', '/income-warning'),
            _drawerItem(context, 'تحميل أدوات (المدير)', '/admin-tools'),
            _drawerItem(context, 'تتبع المواقع', '/location-tracking'),
          ],
        ),
      ),
      body: const Center(
        child: Text('مرحباً بك في تطبيق تنورين للتكييف'),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.right),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
