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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تنورين للتكييف',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (ctx) => LoginPage(),
        '/home': (ctx) => HomePage(),
        '/income': (ctx) => IncomeInvoicePage(),
        '/expense': (ctx) => ExpenseInvoicePage(),
        '/request-money': (ctx) => RequestMoneyPage(),
        '/tools-check': (ctx) => ToolsCheckPage(),
        '/money-review': (ctx) => RequestReviewPage(),
        '/excel-export': (ctx) => ExcelExportPage(),
        '/admin-tools': (ctx) => UploadToolsImagesPage(),
        '/purchase-request': (ctx) => ToolPurchaseRequestPage(toolName: ''),
        '/location-tracking': (ctx) => LocationTrackingPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
