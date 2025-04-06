// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
// import 'package:scan_to_go/core/pages/screens/billing/billing_screen.dart';
//
// import '../payment_screen/payment_screen.dart';
//
// class QRProcessingScreen extends StatefulWidget {
//   const QRProcessingScreen({super.key});
//
//   @override
//   QRProcessingScreenState createState() => QRProcessingScreenState();
// }
//
// class QRProcessingScreenState extends State<QRProcessingScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool isLoading = false;
//   int points = 0;
//   int? id;
//   String? actualCode;
//   final String updateUrlOF = "YOUR_OFFLINE_API_URL";
//   final String updateUrlOL = "YOUR_ONLINE_API_URL";
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   void _onQRViewCreated(QRViewController qrController) {
//     controller = qrController;
//     controller?.scannedDataStream.listen((scanData) {
//       if (!isLoading) {
//         setState(() {
//           actualCode = scanData.code;
//           isLoading = true;
//         });
//         debugPrint("Scanned QR Code: $actualCode");
//         _showDetailsDialog(actualCode!, true);
//       }
//     });
//   }
//
//   void _showDetailsDialog(String details, bool isOnline) {
//     bool isJson = _isJson(details);
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           title: const Text(
//             "QR Code Scanned",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           content: StatefulBuilder(
//             builder: (context, setState) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (!isJson) _buildAnimatedPoints(),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Text(
//                       details,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {
//                       Get.back(); // Close the dialog
//                       Future.delayed(const Duration(milliseconds: 300), () {
//                         // Get.offAll(() => PaymentScreen()); // Navigate and remove QR screen from stack
//                         // Get.to(() => PaymentScreen(title: '',), arguments: 100); // Pass amount dynamically
//                         Get.to(() => BillingScreen(), arguments: 100); // Pass amount dynamically
//
//                       });
//                     },
//                     child: const Text(
//                       "Proceed to Payment",
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildAnimatedPoints() {
//     return Column(
//       children: [
//         // AnimatedSwitcher(
//         //   duration: const Duration(milliseconds: 500),
//         //   child:
//         //   Text(
//         //     'Points $points',
//         //     key: ValueKey<int>(points),
//         //     style: const TextStyle(
//         //       fontSize: 24,
//         //       fontWeight: FontWeight.bold,
//         //       color: Colors.green,
//         //     ),
//         //   ),
//         // ),
//         const SizedBox(height: 16),
//         const Text(
//           "Tap here to pay",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }
//
//   bool _isJson(String data) {
//     try {
//       json.decode(data);
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Scanner'),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: Container(
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: Colors.green, width: 2),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: QRView(
//                   key: qrKey,
//                   onQRViewCreated: _onQRViewCreated,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   actualCode ?? 'Scan a QR code',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// new

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
// import 'package:scan_to_go/core/pages/screens/billing/billing_screen.dart';
//
// class QRProcessingScreen extends StatefulWidget {
//   const QRProcessingScreen({super.key});
//
//   @override
//   QRProcessingScreenState createState() => QRProcessingScreenState();
// }
//
// class QRProcessingScreenState extends State<QRProcessingScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool isLoading = false;
//   String? actualCode;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   void _onQRViewCreated(QRViewController qrController) {
//     controller = qrController;
//     controller?.scannedDataStream.listen((scanData) {
//       if (!isLoading && scanData.code != null && scanData.code!.isNotEmpty) {
//         controller?.pauseCamera(); // Stop scanning temporarily
//         setState(() {
//           actualCode = scanData.code;
//           isLoading = true;
//         });
//
//         debugPrint("📷 Scanned QR Code: $actualCode");
//
//         // Directly navigate to BillingScreen with scanned QR data
//         Get.to(() => BillingScreen(), arguments: {"qrData": actualCode});
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('QR Scanner'), centerTitle: true, backgroundColor: Colors.green),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: Container(
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: Colors.green, width: 2),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: QRView(
//                   key: qrKey,
//                   onQRViewCreated: _onQRViewCreated,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   actualCode ?? 'Scan a QR code',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//------------------ old file without changes before the supabase part sunday  -------------

// -------------------------------old file without changes----------------------

/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:scan_to_go/core/pages/screens/billing/billing_screen.dart';

class QRProcessingScreen extends StatefulWidget {
  const QRProcessingScreen({super.key});

  @override
  QRProcessingScreenState createState() => QRProcessingScreenState();
}

class QRProcessingScreenState extends State<QRProcessingScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isLoading = false;
  int points = 0;
  int? id;
  String? actualCode;
  final String updateUrlOF = "YOUR_OFFLINE_API_URL";
  final String updateUrlOL = "YOUR_ONLINE_API_URL";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.scannedDataStream.listen((scanData) {
      if (!isLoading) {
        if (scanData.code == null || scanData.code!.isEmpty) {
          debugPrint("Error: QR Code is empty or invalid.");
          return;
        }

        controller?.pauseCamera(); // Stop scanning temporarily
        setState(() {
          actualCode = scanData.code;
          isLoading = true;
        });
        debugPrint("Scanned QR Code: $actualCode");
        _showDetailsDialog(actualCode!, true);
      }
    });
  }

  void _showDetailsDialog(String details, bool isOnline) {
    bool isJson = _isJson(details);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            "QR Code Scanned",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isJson) _buildAnimatedPoints(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      details,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Get.back(); // Close the dialog
                      Future.delayed(const Duration(milliseconds: 300), () {
                        Get.to(() => BillingScreen(), arguments: {"qrData": actualCode});
                      });
                    },
                    child: const Text(
                      "Proceed to Payment",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAnimatedPoints() {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          "Tap here to pay",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  bool _isJson(String data) {
    try {
      json.decode(data);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  actualCode ?? 'Scan a QR code',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
//------------------ old file without changes before the supabase part sunday  -------------

// new changes began

// ------------------- previous file -----------------------------
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
// import 'package:scan_to_go/core/pages/screens/billing/billing_screen.dart';
//
// class QRProcessingScreen extends StatefulWidget {
//   const QRProcessingScreen({super.key});
//
//   @override
//   QRProcessingScreenState createState() => QRProcessingScreenState();
// }
//
// class QRProcessingScreenState extends State<QRProcessingScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool isLoading = false;
//   String? actualCode;
//   String? cartId;
//   String? encodedData;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   /// Function triggered when the QR scanner detects a code
//   void _onQRViewCreated(QRViewController qrController) {
//     controller = qrController;
//     controller?.scannedDataStream.listen((scanData) {
//       if (!isLoading) {
//         if (scanData.code == null || scanData.code!.isEmpty) {
//           debugPrint("⚠️ Error: QR Code is empty or invalid.");
//           return;
//         }
//
//         controller?.pauseCamera(); // Stop scanning temporarily
//         setState(() {
//           actualCode = scanData.code;
//           isLoading = true;
//         });
//
//         debugPrint("✅ Scanned QR Code: $actualCode");
//
//         // Extract Cart ID and Encoded Data
//         _extractQRData(actualCode!);
//
//         _showDetailsDialog(actualCode!);
//       }
//     });
//   }
//
//   /// Extracts Cart ID and Encoded Data from the scanned QR Code
//   void _extractQRData(String qrData) {
//     debugPrint("🔍 Extracting data from QR Code...");
//
//     List<String> parts = qrData.split(':');
//     if (parts.length >= 2) {
//       cartId = parts[0];
//       encodedData = parts.sublist(1).join(':'); // Preserve additional colons
//       debugPrint("🛒 Extracted Cart ID: $cartId");
//       debugPrint("🔐 Extracted Encoded Data: $encodedData");
//     } else {
//       debugPrint("❌ Invalid QR Code format! Expected format: 'CartID:EncodedData'");
//     }
//   }
//
//   /// Displays a dialog box with extracted QR details and proceeds to BillingScreen
//   void _showDetailsDialog(String details) {
//     bool isJson = _isJson(details);
//
//     debugPrint("📋 Showing details in dialog...");
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           title: const Text(
//             "QR Code Scanned",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           content: StatefulBuilder(
//             builder: (context, setState) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           "Cart ID: $cartId",
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Encoded Data: $encodedData",
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {
//                       debugPrint("🛒 Navigating to BillingScreen with extracted data...");
//                       debugPrint("📡 Passing Cart ID: $cartId");
//                       debugPrint("📡 Passing Encoded Data: $encodedData");
//
//                       Get.back(); // Close the dialog
//                       Future.delayed(const Duration(milliseconds: 300), () {
//                         Get.to(() => BillingScreen(), arguments: {
//                           "qrData": actualCode,
//                           "cartId": cartId,
//                           "encodedData": encodedData
//                         });
//                       });
//                     },
//                     child: const Text(
//                       "Proceed to Payment",
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   /// Checks if the given data is in JSON format
//   bool _isJson(String data) {
//     try {
//       json.decode(data);
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Scanner'),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: Container(
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: Colors.green, width: 2),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: QRView(
//                   key: qrKey,
//                   onQRViewCreated: _onQRViewCreated,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   actualCode ?? 'Scan a QR code',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ------------------- previous file -----------------------------

// ----------------------------------------- this file have the post api -----------------------------------------
// Keeping original UI and structure intact
/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:scan_to_go/core/pages/screens/billing/billing_screen.dart';

import '../../../../feature/api_services/network_manager/http_helper.dart';

class QRProcessingScreen extends StatefulWidget {
  const QRProcessingScreen({super.key});

  @override
  QRProcessingScreenState createState() => QRProcessingScreenState();
}

class QRProcessingScreenState extends State<QRProcessingScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isLoading = false;
  String? actualCode;
  String? trolly_id;
  String? encrypted_string;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.scannedDataStream.listen((scanData) {
      if (!isLoading) {
        if (scanData.code == null || scanData.code!.isEmpty) {
          debugPrint("⚠️ Error: QR Code is empty or invalid.");
          return;
        }

        controller?.pauseCamera();
        setState(() {
          actualCode = scanData.code;
          isLoading = true;
        });

        debugPrint("✅ Scanned QR Code: $actualCode");
        _extractQRData(actualCode!);
        _sendDataToAPI();
      }
    });
  }

  void _extractQRData(String qrData) {
    debugPrint("🔍 Extracting data from QR Code...");

    List<String> parts = qrData.split(':');
    if (parts.length >= 2) {
      trolly_id = parts[0];
      encrypted_string = parts.sublist(1).join(':');
      debugPrint("🛒 Extracted Cart ID: $trolly_id");
      debugPrint("🔐 Extracted Encoded Data: $encrypted_string");
    } else {
      debugPrint("❌ Invalid QR Code format! Expected format: 'CartID:EncodedData'");
    }
  }

  Future<void> _sendDataToAPI() async {
    if (trolly_id == null || encrypted_string == null) {
      debugPrint("❌ Error: Missing required data.");
      return;
    }

    String apiUrl = "https://smapca.onrender.com/cart/scan"; // Replace with actual API endpoint
    Map<String, dynamic> requestBody = {
      "trolly_id": trolly_id,
      "encrypted_string": encrypted_string
    };

    debugPrint("📡 Sending QR data to API...");
    var response = await HttpHelper().post(url: apiUrl, requestBody: jsonEncode(requestBody));

    if (response != null) {
      debugPrint("✅ API Response: $response");
      _showDetailsDialog(actualCode!);
    } else {
      debugPrint("❌ API call failed.");
    }
  }

  void _showDetailsDialog(String details) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("QR Code Scanned", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Cart ID: $trolly_id", textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("Encoded Data: $encrypted_string", textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Get.back();
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Get.to(() => BillingScreen(), arguments: {"qrData": actualCode, "cartId": trolly_id, "encodedData": encrypted_string});
                  });
                },
                child: const Text("Proceed to Payment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner'), centerTitle: true, backgroundColor: Colors.green),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.green, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(actualCode ?? 'Scan a QR code', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
// ----------------------------------------- this file have the post api -----------------------------------------

// working qr code fast version
/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:scan_to_go/core/pages/screens/billing/billing_screen.dart';
import '../../../../feature/api_services/network_manager/http_helper.dart';

class QRProcessingScreen extends StatefulWidget {
  const QRProcessingScreen({super.key});

  @override
  QRProcessingScreenState createState() => QRProcessingScreenState();
}

class QRProcessingScreenState extends State<QRProcessingScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isLoading = false;
  String? actualCode;
  String? trolly_id;
  String? encrypted_string;
  int lastScanTime = 0; // To debounce scans

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  /// Called when QR scanner detects a new code
  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.scannedDataStream.listen((scanData) {
      final currentTime = DateTime.now().millisecondsSinceEpoch;

      // Debounce to prevent duplicate scans within 2 seconds
      if (!isLoading && (currentTime - lastScanTime) > 2000) {
        lastScanTime = currentTime;

        if (scanData.code == null || scanData.code!.isEmpty) {
          debugPrint("⚠️ QR Code is empty or invalid.");
          return;
        }

        Future.delayed(Duration.zero, () => controller?.pauseCamera());
        setState(() {
          actualCode = scanData.code;
          isLoading = true;
        });

        debugPrint("✅ Scanned QR Code: $actualCode");
        _extractQRData(actualCode!);
        _sendDataToAPI();
      }
    });
  }

  /// Extracts Cart ID and Encrypted Data from QR Code
  void _extractQRData(String qrData) {
    debugPrint("🔍 Extracting data from QR Code...");

    List<String> parts = qrData.split(':');
    if (parts.length >= 2) {
      trolly_id = parts[0];
      encrypted_string = parts.sublist(1).join(':'); // Preserve additional colons
      debugPrint("🛒 Extracted Cart ID: $trolly_id");
      debugPrint("🔐 Extracted Encoded Data: $encrypted_string");
    } else {
      debugPrint("❌ Invalid QR Code format! Expected: 'CartID:EncodedData'");
    }
  }

  /// Sends extracted QR data to API asynchronously
  Future<void> _sendDataToAPI() async {
    if (trolly_id == null || encrypted_string == null) {
      debugPrint("❌ Error: Missing required data.");
      return;
    }

    String apiUrl = "https://smapca.onrender.com/cart/scan";
    Map<String, dynamic> requestBody = {
      "trolly_id": trolly_id,
      "encrypted_string": encrypted_string
    };

    debugPrint("📡 Sending QR data to API...");
    try {
      var response = await HttpHelper().post(url: apiUrl, requestBody: jsonEncode(requestBody));

      if (response != null) {
        debugPrint("✅ API Response: $response");
        _showDetailsDialog(actualCode!);
      } else {
        debugPrint("❌ API call failed.");
      }
    } catch (e) {
      debugPrint("❌ API Error: $e");
    }
  }

  /// Displays a dialog with scanned QR details
  void _showDetailsDialog(String details) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("QR Code Scanned", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Trolly ID: $trolly_id", textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("Encoded Data: $encrypted_string", textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Get.back();
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Get.to(() => BillingScreen(), arguments: {"qrData": actualCode, "cartId": trolly_id, "encodedData": encrypted_string});
                  });
                },
                child: const Text("Proceed to Payment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner'), centerTitle: true, backgroundColor: Colors.green),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.green, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(actualCode ?? 'Scan a QR code', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
// working qr code fast version

/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:scan_to_go/core/pages/screens/billing/billing_screen.dart';
import '../../../../feature/api_services/network_manager/http_helper.dart';

class QRProcessingScreen extends StatefulWidget {
  const QRProcessingScreen({super.key});

  @override
  QRProcessingScreenState createState() => QRProcessingScreenState();
}

class QRProcessingScreenState extends State<QRProcessingScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isLoading = false;
  String? actualCode;
  String? trolly_id;
  String? encrypted_string;
  int lastScanTime = 0; // To debounce scans

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  /// Called when QR scanner detects a new code
  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.scannedDataStream.listen((scanData) {
      final currentTime = DateTime.now().millisecondsSinceEpoch;

      // Debounce to prevent duplicate scans within 2 seconds
      if (!isLoading && (currentTime - lastScanTime) > 2000) {
        lastScanTime = currentTime;

        if (scanData.code == null || scanData.code!.isEmpty) {
          debugPrint("⚠️ QR Code is empty or invalid.");
          return;
        }

        Future.delayed(Duration.zero, () => controller?.pauseCamera());
        setState(() {
          actualCode = scanData.code;
          isLoading = true;
        });

        debugPrint("✅ Scanned QR Code: $actualCode");
        _extractQRData(actualCode!);
        _sendDataToAPI();
      }
    });
  }

  /// Extracts trolly_id and Encrypted Data from QR Code
  void _extractQRData(String qrData) {
    debugPrint("🔍 Extracting data from QR Code...");

    List<String> parts = qrData.split(':');
    if (parts.length >= 2) {
      trolly_id = parts[0];
      encrypted_string = parts.sublist(1).join(':'); // Preserve additional colons
      debugPrint("🛒 Extracted trolly_id: $trolly_id");
      debugPrint("🔐 Extracted encrypted_string (hidden from UI)");
    } else {
      debugPrint("❌ Invalid QR Code format! Expected: 'trolly_id:EncodedData'");
    }
  }

  /// Sends extracted QR data to API asynchronously
  Future<void> _sendDataToAPI() async {
    if (trolly_id == null || encrypted_string == null) {
      debugPrint("❌ Error: Missing required data.");
      return;
    }

    String apiUrl = "https://smapca.onrender.com/cart/scan";
    Map<String, dynamic> requestBody = {
      "trolly_id": trolly_id,
      "encrypted_string": encrypted_string
    };

    debugPrint("📡 Sending QR data to API...");
    try {
      var response = await HttpHelper().post(url: apiUrl, requestBody: jsonEncode(requestBody));

      if (response != null) {
        debugPrint("✅ API Response: $response");
        _showDetailsDialog(actualCode!);
      } else {
        debugPrint("❌ API call failed.");
      }
    } catch (e) {
      debugPrint("❌ API Error: $e");
    }
  }

  /// Displays a dialog with scanned QR details
  void _showDetailsDialog(String details) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("QR Code Scanned", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Trolly ID: $trolly_id", textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("Encrypted Data: $encrypted_string", textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Get.back();
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Get.to(() => BillingScreen(), arguments: {"qrData": actualCode, "Trolly ID": trolly_id, "Encrypted Data": encrypted_string});
                  });
                },
                child: const Text("Proceed to Payment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner'), centerTitle: true, backgroundColor: Colors.green),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.green, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  trolly_id != null ? "trolly_id: $trolly_id" : 'Scan a QR code',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

// // 🏎️ Fast QR Code Processing - Optimized Version
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
// import 'package:scan_to_go/core/pages/screens/billing/billing_screen.dart';
// import '../../../../feature/api_services/network_manager/http_helper.dart';
//
// class QRProcessingScreen extends StatefulWidget {
//   const QRProcessingScreen({super.key});
//
//   @override
//   QRProcessingScreenState createState() => QRProcessingScreenState();
// }
//
// class QRProcessingScreenState extends State<QRProcessingScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool isLoading = false;
//   String? actualCode;
//   String? trolly_id;
//   String? encrypted_string;
//   int lastScanTime = 0;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   /// Called when QR scanner detects a new code
//   void _onQRViewCreated(QRViewController qrController) {
//     controller = qrController;
//     controller?.scannedDataStream.listen((scanData) {
//       final currentTime = DateTime.now().millisecondsSinceEpoch;
//
//       // Debounce to prevent duplicate scans within 2 seconds
//       if (!isLoading && (currentTime - lastScanTime) > 2000) {
//         lastScanTime = currentTime;
//
//         if (scanData.code == null || scanData.code!.isEmpty) {
//           debugPrint("⚠️ QR Code is empty or invalid.");
//           return;
//         }
//
//         Future.delayed(Duration.zero, () => controller?.pauseCamera());
//         setState(() {
//           actualCode = scanData.code;
//           isLoading = true;
//         });
//
//         debugPrint("✅ Scanned QR Code: $actualCode");
//         _extractQRData(actualCode!);
//         _sendDataToAPI();
//       }
//     });
//   }
//
//   /// Extracts Trolly ID and Encrypted Data from QR Code
//   void _extractQRData(String qrData) {
//     debugPrint("🔍 Extracting data from QR Code...");
//
//     List<String> parts = qrData.split(':');
//     if (parts.length >= 2) {
//       trolly_id = parts[0];
//       encrypted_string = parts.sublist(1).join(':'); // Preserve additional colons
//       debugPrint("🛒 Extracted Trolly ID: $trolly_id");
//       debugPrint("🔐 Extracted Encoded Data: $encrypted_string");
//     } else {
//       debugPrint("❌ Invalid QR Code format! Expected: 'trolly_id:encrypted_string'");
//     }
//   }
//
//   /// Sends extracted QR data to API asynchronously
//   Future<void> _sendDataToAPI() async {
//     if (trolly_id == null || encrypted_string == null) {
//       debugPrint("❌ Error: Missing required data.");
//       return;
//     }
//
//     String apiUrl = "https://smapca.onrender.com/cart/scan";
//     Map<String, dynamic> requestBody = {
//       "trolly_id": trolly_id,
//       "encrypted_string": encrypted_string
//     };
//
//     debugPrint("📡 Sending QR data to API...");
//     try {
//       var response = await HttpHelper().post(url: apiUrl, requestBody: jsonEncode(requestBody));
//
//       if (response != null) {
//         debugPrint("✅ API Response: $response");
//         _navigateToBillingScreen(response);
//       } else {
//         debugPrint("❌ API call failed.");
//       }
//     } catch (e) {
//       debugPrint("❌ API Error: $e");
//     }
//   }
//
//   /// Navigates to Billing Screen with structured data
//   void _navigateToBillingScreen(Map<String, dynamic> response) {
//     if (response["success"] == true) {
//       Map<String, dynamic> cartData = response["cartData"] ?? {};
//
//       debugPrint("✅ Extracted Billing Data:");
//       debugPrint("Trolly ID: $trolly_id");
//       debugPrint("Order ID: ${response["order_id"]}");
//       debugPrint("Total: ${cartData["total"]}");
//       debugPrint("Date & Time: ${cartData["datetime"]}");
//       debugPrint("Items: ${cartData["items"]}");
//
//       Get.to(() => BillingScreen(), arguments: {
//         "trolly_id": trolly_id,
//         "order_id": response["order_id"] ?? "N/A",
//         "items": cartData["items"] ?? [],
//         "total": cartData["total"] ?? 0.0,
//         "datetime": cartData["datetime"] ?? "N/A"
//       });
//     } else {
//       debugPrint("❌ Failed to get valid API response.");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('QR Scanner'), centerTitle: true, backgroundColor: Colors.green),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: Container(
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.green, width: 2)),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(actualCode ?? 'Scan a QR code', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:scan_to_go/core/pages/screens/billing/billing_screen.dart';
import '../../../../feature/api_services/network_manager/http_helper.dart';

class QRProcessingScreen extends StatefulWidget {
  const QRProcessingScreen({super.key});

  @override
  QRProcessingScreenState createState() => QRProcessingScreenState();
}

class QRProcessingScreenState extends State<QRProcessingScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isLoading = false;
  String? actualCode;
  String? trolly_id;
  String? encrypted_string;
  String? user_id; // ✅ Added user_id
  int lastScanTime = 0;

  @override
  void initState() {
    super.initState();
    user_id = Get.arguments?["user_id"]; // ✅ Receiving user_id from HomeScreen
    debugPrint("👤 Received User ID in QRProcessingScreen: $user_id");
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  /// Called when QR scanner detects a new code
  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.scannedDataStream.listen((scanData) {
      final currentTime = DateTime.now().millisecondsSinceEpoch;

      // Debounce to prevent duplicate scans within 2 seconds
      if (!isLoading && (currentTime - lastScanTime) > 2000) {
        lastScanTime = currentTime;

        if (scanData.code == null || scanData.code!.isEmpty) {
          debugPrint("⚠️ QR Code is empty or invalid.");
          return;
        }

        Future.delayed(Duration.zero, () => controller?.pauseCamera());
        setState(() {
          actualCode = scanData.code;
          isLoading = true;
        });

        debugPrint("✅ Scanned QR Code: $actualCode");
        _extractQRData(actualCode!);
        _sendDataToAPI();
      }
    });
  }

  /// Extracts Trolly ID and Encrypted Data from QR Code
  void _extractQRData(String qrData) {
    debugPrint("🔍 Extracting data from QR Code...");

    List<String> parts = qrData.split(':');
    if (parts.length >= 2) {
      trolly_id = parts[0];
      encrypted_string =
          parts.sublist(1).join(':'); // Preserve additional colons
      debugPrint("🛒 Extracted Trolly ID: $trolly_id");
      debugPrint("🔐 Extracted Encoded Data: $encrypted_string");
    } else {
      debugPrint(
          "❌ Invalid QR Code format! Expected: 'trolly_id:encrypted_string'");
    }
  }

  /// Sends extracted QR data to API asynchronously
  Future<void> _sendDataToAPI() async {
    if (trolly_id == null || encrypted_string == null || user_id == null) {
      debugPrint("❌ Error: Missing required data.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    String apiUrl = "https://smapca.onrender.com/cart/scan";
    Map<String, dynamic> requestBody = {
      "trolly_id": trolly_id,
      "encrypted_string": encrypted_string,
      "user_id": user_id, // ✅ Passing user_id in API request
    };

    debugPrint("📡 Sending QR data to API...");
     debugPrint("👤 User ID: $user_id"); // ✅ Logging user_id
    try {
      var response = await HttpHelper()
          .post(url: apiUrl, requestBody: jsonEncode(requestBody));

      if (response != null) {
        debugPrint("✅ API Response: $response");
        _navigateToBillingScreen(response);
      } else {
        debugPrint("❌ API call failed.");
      }
    } catch (e) {
      debugPrint("❌ API Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  /// Navigates to Billing Screen with structured data
  void _navigateToBillingScreen(Map<String, dynamic> response) {
    if (response["success"] == true) {
      Map<String, dynamic> cartData = response["cartData"] ?? {};

      debugPrint("✅ Extracted Billing Data:");
      debugPrint("Trolly ID: $trolly_id");
      debugPrint("Order ID: ${response["order_id"]}");
      debugPrint("Total: ${cartData["total"]}");
      debugPrint("Date & Time: ${cartData["datetime"]}");
      debugPrint("Items: ${cartData["items"]}");

      Get.to(() => BillingScreen(), arguments: {
        "trolly_id": trolly_id,
        "order_id": response["order_id"] ?? "N/A",
        "items": cartData["items"] ?? [],
        "total": (cartData["total"] ?? 0).toDouble(), // Fixing int to double issue
        "datetime": cartData["datetime"] ?? "N/A"
      });
    } else {
      debugPrint("❌ Failed to get valid API response.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('QR Scanner'),
          centerTitle: true,
          backgroundColor: Colors.green),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.green, width: 2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child:
                        QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(actualCode ?? 'Scan a QR code',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.6),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
