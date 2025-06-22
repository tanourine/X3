import 'package:flutter/material.dart';
import '../drawer_menu.dart';

class HomePage extends StatelessWidget {
  final List<_Button> buttons = [
    _Button('رفع فاتورة دخل', Icons.upload, '/income'),
    _Button('رفع فاتورة مصاريف', Icons.receipt, '/expense'),
    _Button('طلب أموال', Icons.attach_money, '/request-money'),
    _Button('تشييك العدة', Icons.build, '/tools-check'),
    _Button('المزيد', Icons.menu, '/home'), // يفتح drawer
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تنورين للتكييف')),
      drawer: DrawerMenu(
        userType: 'مدير',
        onItemSelected: (route) {
          Navigator.pop(context);
          Navigator.pushNamed(context, route);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: buttons.map((b) {
            return InkWell(
              onTap: () {
                if (b.route == '/home') {
                  Scaffold.of(context).openDrawer();
                } else {
                  Navigator.pushNamed(context, b.route);
                }
              },
              borderRadius: BorderRadius.circular(100),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(b.icon, size: 40, color: Colors.white),
                    SizedBox(height: 10),
                    Text(b.label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _Button {
  final String label;
  final IconData icon;
  final String route;
  _Button(this.label, this.icon, this.route);
}
