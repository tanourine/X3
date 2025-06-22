import 'package:flutter/material.dart';

// استورد كل صفحاتك هنا:
import 'home_page.dart';
import 'income_invoice_page.dart';
import 'expense_invoice_page.dart';
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تنورين للتكييف',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home':              (c) => const HomePage(),
        '/income':            (c) => const IncomeInvoicePage(),
        '/expense':           (c) => const ExpenseInvoicePage(),
        '/request-money':     (c) => const RequestMoneyPage(),
        '/tools-check':       (c) => const ToolsCheckPage(),
        '/money-review':      (c) => const RequestReviewPage(),
        '/excel-export':      (c) => const ExcelExportPage(),
        '/income-warning':    (c) => const WarningBannerPage(),
        '/admin-tools':       (c) => const UploadToolsImagesPage(),
        '/location-tracking': (c) => const LocationTrackingPage(),
      },
    );
  }
}
