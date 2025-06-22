import 'package:flutter/material.dart';

// استورد هنا جميع الصفحات الموجودة في مجلّد lib
import 'home_page.dart';
import 'income_invoice_page.dart';
import 'request_money_page.dart';
import 'tools_check_page.dart';
import 'request_review_page.dart';
import 'excel_export_page.dart';
import 'warning_banner.dart';            // إذا كان اسم الصف المعرّف فيه هو WarningBanner
import 'upload_tools_images_page.dart'; // يعرّف AdminToolsUploadPage
import 'location_tracking_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/home':                (context) => HomePage(),
        '/income':              (context) => IncomeInvoicePage(),
        '/request-money':       (context) => RequestMoneyPage(),
        '/tools-check':         (context) => ToolsCheckPage(),
        '/money-review':        (context) => RequestReviewPage(),
        '/excel-export':        (context) => ExcelExportPage(),
        '/income-warning':      (context) => WarningBanner(),            // أو WarningBannerPage() حسب الملف
        '/admin-tools':         (context) => AdminToolsUploadPage(),
        '/location-tracking':   (context) => LocationTrackingPage(),
      },
    );
  }
}
