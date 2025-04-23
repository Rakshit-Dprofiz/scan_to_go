/*

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PDFReceiptService {
  static Future<void> createReceipt({
    required String orderId,
    required List<Map<String, dynamic>> items,
    required double total,
    required String dateTime,
    required String userId,
  }) async {
    final pdf = pw.Document();

    // Load logo from assets
    final logoBytes = await rootBundle.load('assets/logo.jpg');
    final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Logo
            pw.Center(
              child: pw.Image(logoImage, width: 100, height: 100),
            ),
            pw.SizedBox(height: 10),

            // Header
            pw.Center(
              child: pw.Text(
                "Receipt",
                style:
                    pw.TextStyle(fontSize: 26, fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.SizedBox(height: 20),

            // Order details
            pw.Text("Order ID: $orderId", style: pw.TextStyle(fontSize: 14)),
            pw.Text("Date: $dateTime", style: pw.TextStyle(fontSize: 14)),
            pw.Text("User ID: $userId", style: pw.TextStyle(fontSize: 14)),
            pw.SizedBox(height: 20),

            // Table Header
            pw.Text("Billing Details:",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),

            // Table
            pw.Table.fromTextArray(
              border: pw.TableBorder.all(),
              cellAlignment: pw.Alignment.centerLeft,
              headerStyle:
                  pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
              cellStyle: pw.TextStyle(fontSize: 12),
              headers: ['Item', 'Qty', 'Price', 'Total'],
              data: items.map((item) {
                final name = item['item'] ?? item['name'] ?? 'Unknown';
                final quantity = item['quantity'] ?? 1;
                final price = item['price'] ?? 0.0;
                final totalItem = price * quantity;
                return [
                  name.toString(),
                  quantity.toString(),
                  "₹${price.toStringAsFixed(2)}",
                  "₹${totalItem.toStringAsFixed(2)}"
                ];
              }).toList(),
            ),

            pw.SizedBox(height: 20),

            // Total Amount
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Text(
                  "Total: ₹${total.toStringAsFixed(2)}",
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // Save the PDF
    final outputDir = await getApplicationDocumentsDirectory();
    final file = File("${outputDir.path}/receipt_$orderId.pdf");
    await file.writeAsBytes(await pdf.save());

    // Open the PDF
    await OpenFile.open(file.path);
  }
}
*/

/*
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PDFReceiptService {
  static Future<void> createReceipt({
    required String orderId,
    required List<Map<String, dynamic>> items,
    required double total,
    required String dateTime,
    String? companyName,
    String? secondImageAsset, // path to second image asset
  }) async {
    final pdf = pw.Document();

    // Load logo from assets
    final logoBytes = await rootBundle.load('assets/logo.jpg');
    final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());

    // Load NotoSans-Regular.ttf for rupee and emoji support
    final customFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/NotoSans-Regular.ttf'),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Logo
            pw.Center(
              child: pw.Image(logoImage, width: 300, height: 300),
            ),
            pw.SizedBox(height: 10),

            // Header
            pw.Center(
              child: pw.Text(
                "Receipt",
                style: pw.TextStyle(
                  font: customFont,
                  fontSize: 26,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.SizedBox(height: 20),

            // Order details
            pw.Text("Order ID: $orderId", style: pw.TextStyle(font: customFont, fontSize: 14)),
            pw.Text("Date: $dateTime", style: pw.TextStyle(font: customFont, fontSize: 14)),
            pw.Text("Name: $name", style: pw.TextStyle(font: customFont, fontSize: 14)), // Replaced userId
            pw.SizedBox(height: 20),

            // Table Header
            pw.Text("Billing Details:", style: pw.TextStyle(font: customFont, fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),

            // Table
            pw.Table.fromTextArray(
              border: pw.TableBorder.all(),
              cellAlignment: pw.Alignment.centerLeft,
              headerStyle: pw.TextStyle(font: customFont, fontSize: 14, fontWeight: pw.FontWeight.bold),
              cellStyle: pw.TextStyle(font: customFont, fontSize: 12),
              headers: ['Item', 'Qty', 'Price', 'Total'],
              data: items.map((item) {
                final name = item['item'] ?? item['name'] ?? 'Unknown';
                final quantity = item['quantity'] ?? 1;
                final price = item['price'] ?? 0.0;
                final totalItem = price * quantity;
                return [
                  name.toString(),
                  quantity.toString(),
                  "₹${price.toStringAsFixed(2)}",
                  "₹${totalItem.toStringAsFixed(2)}"
                ];
              }).toList(),
            ),

            pw.SizedBox(height: 20),

            // Total Amount
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Text(
                  "Total: ₹${total.toStringAsFixed(2)}",
                  style: pw.TextStyle(
                    font: customFont,
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // Save the PDF
    final outputDir = await getApplicationDocumentsDirectory();
    final file = File("${outputDir.path}/receipt_$orderId.pdf");
    await file.writeAsBytes(await pdf.save());

    // Open the PDF
    await OpenFile.open(file.path);
  }
}*/



import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PDFReceiptService {
  static Future<void> createReceipt({
    required String orderId,
    required List<Map<String, dynamic>> items,
    required double total,
    required String dateTime,
    required String name, // Now dynamic
    String? companyName,
    String? secondImageAsset, // not used since you want static network image for now
  }) async {
    final pdf = pw.Document();

    // Load logo from assets
    final logoBytes = await rootBundle.load('assets/logo.jpg');
    final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());

    // Load custom font for ₹ and multilingual support
    final customFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/NotoSans-Regular.ttf'),
    );

    // Load second image from a static network URL
    final secondImage = pw.MemoryImage(
      (await NetworkAssetBundle(Uri.parse("https://img.freepik.com/premium-vector/beautiful-unique-logo-design-ecommerce-retail-company_1287271-14561.jpg"))
          .load(""))
          .buffer
          .asUint8List(),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Logo and Second Image Side-by-Side
            pw.Center(
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Image(logoImage, width: 150, height: 150),
                  pw.SizedBox(width: 20),
                  pw.Image(secondImage, width: 150, height: 150),
                ],
              ),
            ),
            pw.SizedBox(height: 10),

            // Header
            pw.Center(
              child: pw.Text(
                "Receipt",
                style: pw.TextStyle(
                  font: customFont,
                  fontSize: 26,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.SizedBox(height: 20),

            // Order details
            pw.Text("Order ID: $orderId", style: pw.TextStyle(font: customFont, fontSize: 14)),
            pw.Text("Date: $dateTime", style: pw.TextStyle(font: customFont, fontSize: 14)),
            pw.Text("Name: $name", style: pw.TextStyle(font: customFont, fontSize: 14)),
            pw.Text("Company: ${companyName ?? "No Company Name"}", style: pw.TextStyle(font: customFont, fontSize: 14)),
            pw.SizedBox(height: 20),

            // Table Header
            pw.Text("Billing Details:", style: pw.TextStyle(font: customFont, fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),

            // Table
            pw.Table.fromTextArray(
              border: pw.TableBorder.all(),
              cellAlignment: pw.Alignment.centerLeft,
              headerStyle: pw.TextStyle(font: customFont, fontSize: 14, fontWeight: pw.FontWeight.bold),
              cellStyle: pw.TextStyle(font: customFont, fontSize: 12),
              headers: ['Item', 'Qty', 'Price', 'Total'],
              data: items.map((item) {
                final itemName = item['item'] ?? item['name'] ?? 'Unknown';
                final quantity = item['quantity'] ?? 1;
                final price = item['price'] ?? 0.0;
                final totalItem = price * quantity;
                return [
                  itemName.toString(),
                  quantity.toString(),
                  "₹${price.toStringAsFixed(2)}",
                  "₹${totalItem.toStringAsFixed(2)}"
                ];
              }).toList(),
            ),

            pw.SizedBox(height: 20),

            // Total Amount
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Text(
                  "Total: ₹${total.toStringAsFixed(2)}",
                  style: pw.TextStyle(
                    font: customFont,
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // Save the PDF
    final outputDir = await getApplicationDocumentsDirectory();
    final file = File("${outputDir.path}/receipt_$orderId.pdf");
    await file.writeAsBytes(await pdf.save());

    // Open the PDF
    await OpenFile.open(file.path);
  }
}

