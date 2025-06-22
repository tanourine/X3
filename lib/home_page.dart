import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> buttons = [
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
        title: Text("الرئيسية"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: buttons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final button = buttons[index];
          return ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, button['route']);
            },
            child: Text(button['title'], textAlign: TextAlign.center),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              primary: Colors.blue[700],
              textStyle: TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
