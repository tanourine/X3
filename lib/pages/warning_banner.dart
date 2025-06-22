import 'package:flutter/material.dart';

class IncomeWarningBanner extends StatelessWidget {
  final String technicianName;
  final bool showWarning;

  const IncomeWarningBanner({
    Key? key,
    required this.technicianName,
    required this.showWarning,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!showWarning) return SizedBox.shrink();

    return Container(
      color: Colors.yellow[700],
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(Icons.warning, color: Colors.black),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              '⚠️ عدد فواتير الإيرادات غير مطابق لعدد الطلبات المنفذة للفني "$technicianName"',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
