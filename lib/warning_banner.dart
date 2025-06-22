// lib/warning_banner.dart
import 'package:flutter/material.dart';

/// صفحتك لتنبيه الإيرادات
/// اضفنا هنا كونستركتور const يطابق اسم الكلاس
class WarningBannerPage extends StatelessWidget {
  /// اسـم الفني (يمكن تركه افتراضياً)
  final String technicianName;

  /// هل نظهر التنبيه أم لا (يمكن تركه افتراضياً)
  final bool showWarning;

  const WarningBannerPage({
    Key? key,
    this.technicianName = '',
    this.showWarning = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // إذا غير مطلوب عرض التنبيه نعيد صفحة فارغة
    if (!showWarning) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('تنبيه الإيرادات')),
      body: Center(
        child: MaterialBanner(
          content: Text(
            'تنبيه! هنالك مشكلة لدى الفني $technicianName',
            style: const TextStyle(color: Colors.red),
          ),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearMaterialBanners();
              },
              child: const Text('حسناً'),
            ),
          ],
        ),
      ),
    );
  }
}
