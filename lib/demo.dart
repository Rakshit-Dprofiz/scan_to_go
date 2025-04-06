import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:printing/printing.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Razorpay Payment Demo',
      home: NFCReaderScreen(),
    );
  }
}

// Main Screen with "Pay" button
class NFCReaderScreen extends StatefulWidget {
  @override
  _NFCReaderScreenState createState() => _NFCReaderScreenState();
}

class _NFCReaderScreenState extends State<NFCReaderScreen> {
  late Razorpay _razorpay;
  late PaymentService _paymentService;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _paymentService = PaymentService(_razorpay);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Release resources
    super.dispose();
  }

  void _onPayNow() {
    Map<String, dynamic> dummyPlan = {
      'plan_name': 'Basic Plan',
      'monthly_price': 199,
    };

    int ownerId = 123; // Dummy owner ID
    int planId = 1;    // Dummy plan ID

    _paymentService.openPayment(dummyPlan, ownerId, planId, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pay via Razorpay')),
      body: Center(
        child: ElevatedButton(
          onPressed: _onPayNow,
          child: Text("Pay ₹199"),
        ),
      ),
    );
  }
}


class PaymentService {
  final Razorpay razorpay;

  PaymentService(this.razorpay);

  void openPayment(
      Map<String, dynamic> plan, int ownerId, int planId, BuildContext context) {
    String planName = plan['plan_name'] ?? 'Unknown Plan';
    int amount = (plan['monthly_price'] != null)
        ? (plan['monthly_price'] * 100).toInt()
        : 100;

    debugPrint("💰 Opening payment for $planName: ₹${amount / 100}");

    var options = {
      'key': 'rzp_test_kz6NrKGGxbnS9n', // ✅ Test Key
      'amount': amount, // in paise
      'name': 'Dprofiz Pvt Ltd',
      'description': 'Subscription Plan: $planName',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@gmail.com',
      },
      'notes': {
        'Merchant Name': 'Dprofiz Pvt Ltd',
        'Plan ID': planId.toString(),
      },
      'external': {
        'wallets': ['paytm'],
      },
    };

    try {
      razorpay.open(options);

      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
              (PaymentSuccessResponse response) {
            handlePaymentSuccess(
                response, context, ownerId, planId, planName, amount);
          });

      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
              (PaymentFailureResponse response) {
            handlePaymentError(response, context);
          });

      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
              (ExternalWalletResponse response) {
            Fluttertoast.showToast(msg: "💼 External Wallet: ${response.walletName}");
          });

    } catch (e) {
      debugPrint("❌ Error opening Razorpay: $e");
      Fluttertoast.showToast(msg: 'Error opening payment gateway.');
    }
  }

  void handlePaymentSuccess(
      PaymentSuccessResponse response,
      BuildContext context,
      int ownerId,
      int planId,
      String planName,
      int amount,
      ) async {
    String paymentId = response.paymentId ?? "N/A";
    // String signature = response.signature ?? "No Signature";
    // String orderId = response.orderId ?? "N/A";
    String paymentTime = DateTime.now().toIso8601String();

    debugPrint("✅ Payment Successful:");
    debugPrint("  🔹 Payment ID: $paymentId");
    // debugPrint("  🔹 Order ID: $orderId");
    // debugPrint("  🔹 Signature: $signature");
    debugPrint("  🔹 Time: $paymentTime");

    Fluttertoast.showToast(msg: '✅ Payment Successful! ID: $paymentId');

    // You can now call your backend API to store payment details here
  }

  void handlePaymentError(
      PaymentFailureResponse response, BuildContext context) {
    debugPrint("❌ Payment Failed:");
    debugPrint("  🔹 Code: ${response.code}");
    debugPrint("  🔹 Message: ${response.message}");

    Fluttertoast.showToast(msg: '❌ Payment Failed! Please try again.');
  }
}



// class NFCReaderScreen extends StatefulWidget {
//   const NFCReaderScreen({super.key});
//
//   @override
//   State<NFCReaderScreen> createState() => _NFCReaderScreenState();
// }
//
// class _NFCReaderScreenState extends State<NFCReaderScreen> {
//   String _nfcData = 'Tap NFC card to read...';
//
//   @override
//   void initState() {
//     super.initState();
//     _checkNFCAvailability();
//   }
//
//   Future<void> _checkNFCAvailability() async {
//     bool isAvailable = await NfcManager.instance.isAvailable();
//     if (!isAvailable) {
//       setState(() {
//         _nfcData = '❌ NFC is not available on this device.';
//       });
//     } else {
//       _startNFCSession();
//     }
//   }
//
//   void _startNFCSession() {
//     NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
//       print("✅ NFC tag discovered: $tag");
//
//       try {
//         // Read tag ID or content (works for most types)
//         final identifier = tag.data['nfca']?['identifier'] ??
//             tag.data['ndef']?['identifier'] ??
//             tag.data['mifareclassic']?['identifier'];
//
//         if (identifier != null) {
//           String uid = identifier.toString();
//           print("🆔 Card UID: $uid");
//
//           setState(() {
//             _nfcData = "📲 Card UID: $uid";
//           });
//         } else {
//           print("⚠️ Tag has no identifier");
//           setState(() {
//             _nfcData = "⚠️ Could not read UID.";
//           });
//         }
//
//         await NfcManager.instance.stopSession();
//       } catch (e) {
//         print("❌ Exception: $e");
//         await NfcManager.instance.stopSession(errorMessage: "Read failed");
//         setState(() {
//           _nfcData = "❌ Failed to read tag.";
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     NfcManager.instance.stopSession();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('NFC Reader'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Text(
//             _nfcData,
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

