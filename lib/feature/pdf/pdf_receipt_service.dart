// lib/services/pdf_receipt_service.dart

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

class PDFReceiptService {
  // Log tag
  static const String _logTag = "[PDF_RECEIPT]";

  /// Generates and saves a PDF receipt to external storage and opens it
  static Future<void> generateAndSaveReceipt({
    required String orderId,
    required List<dynamic> items,
    required double total,
    required String dateTime,
    required String userId,
  }) async {
    try {
      print("$_logTag 🔐 Checking storage permissions...");
      final isPermissionGranted = await _requestStoragePermission();

      if (!isPermissionGranted) {
        print("$_logTag ❌ Cannot proceed without permission.");
        return;
      }

      final pdf = pw.Document();
      // final formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(dateTime));

      // 📄 Building PDF layout
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text("🧾 Trolleze Receipt", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text("Order ID: $orderId"),
              pw.Text("User ID: $userId"),
              // pw.Text("Date & Time: $formattedDate"),
              pw.SizedBox(height: 20),
              pw.Text("📦 Items:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ...items.map((item) {
                final name = item['name'] ?? 'N/A';
                final qty = item['quantity'] ?? 0;
                final price = item['price'] ?? 0;
                return pw.Text("• $name - Qty: $qty × ₹$price");
              }),
              pw.SizedBox(height: 20),
              pw.Text("💰 Total: ₹$total", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            ],
          ),
        ),
      );

      // 💾 Saving the PDF
      final outputDir = await getExternalStorageDirectory();
      if (outputDir == null) throw Exception("Failed to get storage directory");

      final filePath = "${outputDir.path}/receipt_$orderId.pdf";
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      print("$_logTag ✅ PDF saved at: $filePath");

      // 📂 Opening the file
      final result = await OpenFile.open(filePath);
      print("$_logTag 📂 Open file result: ${result.message}");
    } catch (e) {
      print("$_logTag ❌ Error generating or opening receipt: $e");
    }
  }

  /// Requests necessary storage permissions
  /// Requests necessary storage permissions
  static Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted) {
        print("$_logTag ✅ Storage permission granted (generic).");
        return true;
      }

      // For Android 11 and above, try manageExternalStorage
      if (await Permission.manageExternalStorage.isGranted) {
        print("$_logTag ✅ Manage External Storage permission granted.");
        return true;
      }

      // Ask both
      final status = await [
        Permission.storage,
        Permission.manageExternalStorage,
      ].request();

      if (status[Permission.storage]?.isGranted == true ||
          status[Permission.manageExternalStorage]?.isGranted == true) {
        print("$_logTag ✅ Storage permission granted after request.");
        return true;
      } else {
        print("$_logTag ❌ Storage permission denied.");
        return false;
      }
    }

    return true; // iOS doesn't need permission
  }



}
