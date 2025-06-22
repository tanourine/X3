import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<Map<String, String>> buttons = [
    {'title': 'رفع فاتورة دخل', 'route': '/income'},
    {'title': 'رفع فاتورة مصاريف', 'route': '/expense'},
    {'title': 'طلب أموال', 'route': '/request_money'},
    {'title': 'تشييك العدة', 'route': '/tools_check'},
    {'title': 'المزيد', 'route': '/settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الرئيسية"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: buttons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final button = buttons[index];
          return ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, button['route']!);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.blue[700],
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: Text(
              button['title']!,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
