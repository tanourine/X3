import 'package:flutter/material.dart';
import 'drawer_menu.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/income_invoice_page.dart';
import 'pages/expense_invoice_page.dart';
import 'pages/request_money_page.dart';
import 'pages/tools_check_page.dart';
import 'pages/request_review_page.dart';
import 'pages/excel_export_page.dart';
import 'pages/upload_tools_images_page.dart';
import 'pages/tool_purchase_request_page.dart';
import 'pages/location_tracking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تنورين للتكييف',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':           (_) => const LoginPage(),
        '/home':       (_) => const HomePage(),
        '/income':     (_) => const IncomeInvoicePage(),
        '/expense':    (_) => const ExpenseInvoicePage(),
        '/request-money':    (_) => const RequestMoneyPage(),
        '/tools-check':      (_) => const ToolsCheckPage(),
        '/money-review':     (_) => const RequestReviewPage(),
        '/excel-export':     (_) => const ExcelExportPage(),
        '/admin-tools':      (_) => const UploadToolsImagesPage(),
        '/purchase-request': (_) => const ToolPurchaseRequestPage(toolName: ''),
        '/location-tracking':(_) => const LocationTrackingPage(),
      },
    );
  }
}
