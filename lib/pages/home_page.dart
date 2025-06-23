import 'package:flutter/material.dart';
import '../drawer_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = <_Btn>[
      _Btn('رفع فاتورة دخل', Icons.upload, '/income'),
      _Btn('رفع فاتورة مصاريف', Icons.receipt, '/expense'),
      _Btn('طلب أموال', Icons.attach_money, '/request-money'),
      _Btn('تشييك العدة', Icons.build, '/tools-check'),
      _Btn('المزيد', Icons.menu, '/home'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('تنورين للتكييف')),
      drawer: DrawerMenu(
        userType: 'مدير',
        onItemSelected: (route) => Navigator.pushNamed(context, route),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(b.icon, size: 40, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(b.label,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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

class _Btn {
  final String label;
  final IconData icon;
  final String route;
  const _Btn(this.label, this.icon, this.route);
}
