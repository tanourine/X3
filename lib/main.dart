import 'package:flutter/material.dart';

// استيراد قائمة التنقل (الـ Drawer) والصفحات المختلفة
import 'drawer_menu.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'expense_invoice_page.dart';
import 'income_invoice_page.dart';
import 'request_money_page.dart';
import 'request_review_page.dart';
import 'excel_export_page.dart';
import 'location_tracking_page.dart';
import 'settings_page.dart';
import 'tools_check_page.dart';
import 'upload_tools_images_page.dart';
import 'warning_banner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيقي متعدد الصفحات',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      // يبدأ التطبيق بقائمة التنقل التي تتولى عرض الـ Scaffold والـ Drawer
      home: const DrawerMenu(),

      // تعريف المسارات لتمكين التنقل المسمّى
      routes: {
        '/home': (_) => const HomePage(),
        '/login': (_) => const LoginPage(),
        '/expense': (_) => const ExpenseInvoicePage(),
        '/income': (_) => const IncomeInvoicePage(),
        '/request_money': (_) => const RequestMoneyPage(),
        '/request_review': (_) => const RequestReviewPage(),
        '/export_excel': (_) => const ExcelExportPage(),
        '/location': (_) => const LocationTrackingPage(),
        '/settings': (_) => const SettingsPage(),
        '/tools_check': (_) => const ToolsCheckPage(),
        '/upload_tools_images': (_) => const UploadToolsImagesPage(),
        '/warning': (_) => const WarningBanner(),
      },
    );
  }
}
