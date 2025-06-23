import 'package:flutter/material.dart';

class IncomeWarningBanner extends StatelessWidget {
  final String technicianName;
  final bool showWarning;

  const IncomeWarningBanner({
    super.key,
    required this.technicianName,
    required this.showWarning,
  });

  @override
  Widget build(BuildContext context) {
    if (!showWarning) return const SizedBox.shrink();
    return Container(
      color: Colors.yellow[700],
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.warning, color: Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '⚠️ عدد فواتير الإيرادات غير مطابق لطلبات الفني "$technicianName"',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
