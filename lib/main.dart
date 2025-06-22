import 'package:flutter/material.dart';

// استورد DrawerMenu بدلاً من HomePage المكرر
import 'drawer_menu.dart';
import 'income_invoice_page.dart';
import 'request_money_page.dart';
import 'tools_check_page.dart';
import 'request_review_page.dart';
import 'excel_export_page.dart';
import 'warning_banner.dart';
import 'upload_tools_images_page.dart';
import 'location_tracking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تنورين للتكييف',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // نجعل DrawerMenu هو الشاشة الرئيسية
      home: const DrawerMenu(),
      routes: {
        '/income': (_) => const IncomeInvoicePage(),
        '/request-money': (_) => const RequestMoneyPage(),
        '/tools-check': (_) => ToolsCheckPage(),            // إذا أردت تجعلها const أضف const في الـ constructor
        '/money-review': (_) => RequestReviewPage(),
        '/excel-export': (_) => const ExcelExportPage(),
        '/income-warning': (_) => const WarningBannerPage(),
        '/admin-tools': (_) => AdminToolsUploadPage(),
        '/location-tracking': (_) => const LocationTrackingPage(),
      },
    );
  }
}
