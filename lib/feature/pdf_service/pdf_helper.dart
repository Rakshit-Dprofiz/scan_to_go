import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfHelper {
  static Future<void> generateAndDownloadPDF({
    required String transactionId,
    required double amount,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text('Payment Receipt',
                  style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Transaction ID: $transactionId'),
              pw.Text('Amount Paid: ₹$amount'),
            ],
          ),
        ),
      ),
    );

    try {
      if (await _requestStoragePermission()) {
        final directory = await getExternalStorageDirectory();
        final filePath = "${directory!.path}/receipt_$transactionId.pdf";
        final file = File(filePath);
        await file.writeAsBytes(await pdf.save());
        OpenFile.open(filePath);
      }
    } catch (e) {
      print("🔴 PDF Error: $e");
    }
  }

  static Future<bool> _requestStoragePermission() async {
    var status = await Permission.storage.request();
    return status.isGranted;
  }
}
