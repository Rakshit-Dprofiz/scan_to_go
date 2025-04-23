/*
import 'package:get/get.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Payment Controller using GetX for state management
class PaymentController extends GetxController {
  var productItems = <Map<String, dynamic>>[].obs;
  var timeStamp = DateTime.now().obs;
  var totalPrice = 0.0.obs;
  var cartId = ''.obs;

  String generateCartId() {
    return "CART-${Random().nextInt(999999)}";
  }

  void addProduct(String name, double price) {
    if (cartId.value.isEmpty) {
      cartId.value = generateCartId();
    }
    productItems.add({'cartId': cartId.value, 'name': name, 'price': price});
    calculateTotal();
  }

  void calculateTotal() {
    totalPrice.value = productItems.fold(0, (sum, item) => sum + item['price']);
  }

  Future<void> fetchBillingDetails(String qrData) async {
    try {
      final response = await http.get(Uri.parse('YOUR_API_URL?data=$qrData'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        productItems.clear();
        for (var item in data['products']) {
          addProduct(item['name'], item['price'].toDouble());
        }
      } else {
        throw Exception("Failed to fetch billing details");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}*/

// working code
// RazorpayService.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class RazorpayService {
//   late Razorpay _razorpay;
//   Function(String? paymentId)? onPaymentSuccess;
//
//   RazorpayService({this.onPaymentSuccess}) {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
//   }
//
//   void openPaymentGateway(double amount) {
//     var options = {
//       'key': 'rzp_test_kz6NrKGGxbnS9n', // Replace with your Razorpay Key
//       'amount': (amount * 100).toInt(), // Convert to paisa correctly
//       'name': 'Scan To Go',
//       'description': 'Payment for your order',
//       'theme': {'color': '#3399cc'},
//     };
//
//     try {
//       print("🟢 Opening Razorpay with options: $options");
//       _razorpay.open(options);
//     } catch (e) {
//       print("🔴 Razorpay Error: $e");
//       Get.snackbar(
//           "Payment Error",
//           "Could not open payment gateway",
//           backgroundColor: Colors.red,
//           snackPosition: SnackPosition.BOTTOM
//       );
//     }
//   }
//
//   void handlePaymentSuccess(PaymentSuccessResponse response) {
//     // Log all details including raw response
//     print("✅ Payment Success Raw Response: ${response.toString()}");
//     print("Payment Success: ${response.paymentId}");
//
//
//     // Execute callback if provided
//     if (onPaymentSuccess != null) {
//       onPaymentSuccess!(response.paymentId);
//     }
//
//     Get.snackbar(
//         "Payment Success",
//         response.paymentId != null ? "Transaction ID: ${response.paymentId}" : "Payment completed successfully",
//         backgroundColor: Colors.green,
//         snackPosition: SnackPosition.BOTTOM
//     );
//   }
//
//   void handlePaymentError(PaymentFailureResponse response) {
//     print("🔴 Payment Failed: ${response.code}");
//     print("📝 Error Message: ${response.message}");
//     print("⚠️ Full Error Data: ${response.toString()}");
//
//     Get.snackbar(
//         "Payment Failed",
//         "Error: ${response.message ?? 'Unknown error'} (Code: ${response.code})",
//         backgroundColor: Colors.red,
//         snackPosition: SnackPosition.BOTTOM
//     );
//   }
//
//   void handleExternalWallet(ExternalWalletResponse response) {
//     print("⚠️ External Wallet Used: ${response.walletName}");
//
//     Get.snackbar(
//         "External Wallet",
//         "Wallet: ${response.walletName}",
//         backgroundColor: Colors.orange,
//         snackPosition: SnackPosition.BOTTOM
//     );
//   }
//
//   void dispose() {
//     _razorpay.clear();
//   }
// }

// working code
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class RazorpayService {
//   late Razorpay _razorpay;
//
//   RazorpayService() {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   void openPaymentGateway(double amount) {
//     var options = {
//       'key': 'rzp_test_kz6NrKGGxbnS9n', // Replace with your Razorpay Key
//       'amount': (amount * 100).toInt(), // Convert to paisa correctly
//       'name': 'Scan To Go',
//       'description': 'Payment for your order',
//       'prefill': {
//         'contact': '9876543210', // Replace with dynamic contact
//         'email': 'user@example.com'  // Replace with dynamic email
//       },
//       'theme': {'color': '#3399cc'},
//     };
//
//     try {
//       print("🟢 Opening Razorpay with options: $options"); // Debug log
//       _razorpay.open(options);
//     } catch (e) {
//       print("🔴 Razorpay Error: $e");
//     }
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     print("Payment Success: ${response.paymentId}");
//     print("Order ID: ${response.orderId}");
//     print("Signature: ${response.signature}");
//     Get.snackbar("Payment Success", "Transaction ID: ${response.paymentId}",
//         backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     print("🔴 Payment Failed: ${response.code}");
//     print("📝 Error Message: ${response.message}");
//     print("⚠️ Full Error Data: ${response.toString()}");
//
//     Get.snackbar(
//       "Payment Failed",
//       "Error: ${response.message} (Code: ${response.code})",
//       backgroundColor: Colors.red,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print("⚠️ External Wallet Used: ${response.walletName}");
//     Get.snackbar("External Wallet", "Wallet: ${response.walletName}",
//         backgroundColor: Colors.orange, snackPosition: SnackPosition.BOTTOM);
//   }
//
//   void dispose() {
//     _razorpay.clear();
//   }
// }

// working code

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class RazorpayService {
//   late Razorpay _razorpay;
//   final Function(String paymentId) onPaymentSuccess;
//
//   RazorpayService({required this.onPaymentSuccess}) {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   // Open the payment gateway with amount and other details
//   void openPaymentGateway(double amount) {
//     var options = {
//       'key': 'rzp_test_kz6NrKGGxbnS9n', // Replace with your Razorpay Key
//       'amount': (amount * 100).toInt(), // Convert to paisa correctly
//       'name': 'Scan To Go',
//       'description': 'Payment for your order',
//       'prefill': {
//         'contact': '9876543210', // Replace with dynamic contact
//         'email': 'user@example.com' // Replace with dynamic email
//       },
//       'theme': {'color': '#3399cc'},
//     };
//
//     try {
//       print("🟢 Opening Razorpay with options: $options"); // Debug log
//       _razorpay.open(options);
//     } catch (e) {
//       print("🔴 Razorpay Error: $e");
//     }
//   }
//
//   // Handling payment success
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     print("✅ Payment Successful!");
//     print("🔹 Payment ID: ${response.paymentId}");
//
//     if (response.paymentId != null) {
//       print("✅ Payment ID received: ${response.paymentId}");
//       onPaymentSuccess(response.paymentId!);  // Your callback function
//       Get.snackbar(
//         "Payment Success",
//         "Payment ID: ${response.paymentId}",
//         backgroundColor: Colors.green,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } else {
//       print("⚠️ Payment completed but Payment ID is null!");
//       Get.snackbar(
//         "Payment Warning",
//         "Payment completed but Payment ID is null!",
//         backgroundColor: Colors.orange,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }
//
//
//   // Handling payment failure
//   void _handlePaymentError(PaymentFailureResponse response) {
//     print("🔴 Payment Failed: ${response.code}");
//     print("📝 Error Message: ${response.message}");
//     print("⚠️ Full Error Data: ${response.toString()}");
//
//     Get.snackbar(
//       "Payment Failed",
//       "Error: ${response.message} (Code: ${response.code})",
//       backgroundColor: Colors.red,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   // Handling external wallet usage
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print("⚠️ External Wallet Used: ${response.walletName}");
//     Get.snackbar(
//       "External Wallet",
//       "Wallet: ${response.walletName}",
//       backgroundColor: Colors.orange,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
// // Call API on successful payment
// //   Future<void> sendPaymentData(String paymentId, double amount) async {
// //     String apiUrl = "https://smapca.onrender.com/api/payments/update-payment-status";
// //     Map<String, dynamic> requestBody = {
// //       "payment_id": paymentId,
// //       "amount": amount,
// //     };
// //
// //     print("📡 Sending Payment Success Data to API...");
// //     try {
// //       var response = await HttpHelper().post(url: apiUrl, requestBody: jsonEncode(requestBody));
// //       if (response != null) {
// //         print("✅ API Response: $response");
// //       } else {
// //         print("❌ API call failed.");
// //       }
// //     } catch (e) {
// //       print("❌ API Error: $e");
// //     }
// //   }
//
//   // Clear Razorpay resources when done
//   void dispose() {
//     _razorpay.clear();
//   }
// }

/*

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService {
  late Razorpay _razorpay;
  final Function(String?) onPaymentSuccess; // Callback to pass paymentId

  RazorpayService({required this.onPaymentSuccess}) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  // Open the payment gateway with amount and other details
  void openPaymentGateway(double amount) {
    var options = {
      'key': 'rzp_test_kz6NrKGGxbnS9n', // Replace with your Razorpay Key
      'amount': (amount * 100).toInt(), // Convert to paisa correctly
      'name': 'Smapca',
      //'order_id': orderId, // Replace with actual order ID from your backend
      'order_id': 'orderId',
      'description': 'Payment for your order',
      'prefill': {
        'contact': '9876543210', // Replace with dynamic contact
        'email': 'user@example.com'  // Replace with dynamic email
      },
      'theme': {'color': '#3399cc'},
    };

    try {
      print("🟢 Opening Razorpay with options: $options"); // Debug log
      _razorpay.open(options);
    } catch (e) {
      print("🔴 Razorpay Error: $e");
    }
  }

  // Handling payment success
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("✅ Full Payment Success Response: ${response.toString()}");
    print("✅ Full Payment Success Response (Raw Object): ${response.runtimeType} -> ${response}");

    String paymentId = response.paymentId ?? "N/A";

    // Ensure transactionId is non-null
    String transactionId = response.paymentId ?? 'UNKNOWN_PAYMENT_ID';

    // If paymentId is null, print a warning
    if (response.paymentId == null) {
      print("⚠️ Warning: Payment ID is null!");

    }

    double amount = 100.0; // Replace with actual amount from payment response

    // PdfHelper.generateAndDownloadPDF(
    //   transactionId: transactionId,
    //   amount: amount,
    // );

    // Show success message
    Get.snackbar(
      "Payment Success",
      "Transaction ID: $transactionId",
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );

    // Call the callback to pass the Payment ID to the caller (PaymentScreen)
    onPaymentSuccess(transactionId);

    // Send Payment Data to API
    // sendPaymentData(transactionId, amount);
  }

  // Handling payment failure
  void _handlePaymentError(PaymentFailureResponse response) {
    print("🔴 Payment Failed: ${response.code}");
    print("📝 Error Message: ${response.message}");
    print("⚠️ Full Error Data: ${response.toString()}");

    Get.snackbar(
      "Payment Failed",
      "Error: ${response.message} (Code: ${response.code})",
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Handling external wallet usage
  void _handleExternalWallet(ExternalWalletResponse response) {
    print("⚠️ External Wallet Used: ${response.walletName}");
    Get.snackbar(
      "External Wallet",
      "Wallet: ${response.walletName}",
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Clear Razorpay resources when done
  void dispose() {
    _razorpay.clear();
  }
}
*/

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class RazorpayService {
//   late Razorpay _razorpay;
//   final Function(String) onPaymentSuccess;
//
//   RazorpayService({required this.onPaymentSuccess}) {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   /// Open the Razorpay payment gateway with the given amount and orderId
//   void openPaymentGateway(double amount, String orderId) {
//     var options = {
//       'key': 'rzp_test_kz6NrKGGxbnS9n', // Replace with your actual Razorpay Key
//       'amount': (amount * 100).toInt(), // Convert amount to paisa
//       //'order_id': orderId, // ✅ Include the backend-generated order ID here
//       'name': 'Smapca',
//       'description': 'Payment for your order',
//       'prefill': {
//         'contact': '9876543210',
//         'email': 'user@example.com'
//       },
//       'theme': {'color': '#3399cc'},
//     };
//
//     try {
//       print("🟢 Opening Razorpay with options: $options");
//       _razorpay.open(options);
//     } catch (e) {
//       print("🔴 Razorpay Error: $e");
//     }
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//
//     print("✅ Payment Success - Raw Response: ${response.toString()}");
//     print("✅ Payment Success - Raw Response: ${response.paymentId}");
//     String paymentId = response.paymentId ?? 'UNKNOWN_PAYMENT_ID';
//
//     if (paymentId == 'UNKNOWN_PAYMENT_ID') {
//       print("⚠️ Warning: paymentId is null in the PaymentSuccessResponse!");
//     } else {
//       print("🆔 Received Payment ID: $paymentId");
//     }
//
//     Get.snackbar(
//       "Payment Success",
//       "Transaction ID: $paymentId",
//       backgroundColor: Colors.green,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//
//     onPaymentSuccess(paymentId);
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     print("🔴 Payment Failed");
//     print("❌ Error Code: ${response.code}");
//     print("📝 Error Message: ${response.message}");
//
//     Get.snackbar(
//       "Payment Failed",
//       "Error: ${response.message} (Code: ${response.code})",
//       backgroundColor: Colors.red,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print("⚠️ External Wallet Used: ${response.walletName}");
//
//     Get.snackbar(
//       "External Wallet",
//       "Wallet: ${response.walletName}",
//       backgroundColor: Colors.orange,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   void dispose() {
//     _razorpay.clear();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService {
  late Razorpay _razorpay;
  final Function(String) onPaymentSuccess; // Callback to pass paymentId

  RazorpayService({required this.onPaymentSuccess}) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  /// Open the Razorpay payment gateway with the given amount
  void openPaymentGateway(double amount) {
    var options = {
      'key': 'rzp_test_kz6NrKGGxbnS9n', // Replace with your actual Razorpay Key
      'amount': (amount * 100).toInt(), // Convert amount to paisa
      'name': 'Smapca',
      'description': 'Payment for your order',
      'prefill': {
        'contact': '9876543210', // Replace with actual user contact
        'email': 'user@example.com' // Replace with actual user email
      },
      'theme': {'color': '#3399cc'},
    };

    try {
      print("🟢 Opening Razorpay with options: $options");
      _razorpay.open(options);
    } catch (e) {
      print("🔴 Razorpay Error: $e");
    }
  }

  /// Handles successful payment
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Log the complete raw response to inspect available fields
    print("✅ Payment Success - Raw Response: ${response.toString()}");
    print("🧾 Full Response: ${response.toString()}");
    // Check if paymentId exists
    String paymentId = response.paymentId ?? 'UNKNOWN_PAYMENT_ID';

    if (paymentId == 'UNKNOWN_PAYMENT_ID') {
      print("⚠️ Warning: paymentId is null in the PaymentSuccessResponse!");
    } else {
      print("🆔 Received Payment ID: $paymentId");
    }

    // Show success message to the user
    Get.snackbar(
      "✅ Payment Success",
      "Click on End Shopping in your cart 🛒",
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 200), // 👈 vertical moves it to center-like position
      borderRadius: 12,
      isDismissible: false,
      forwardAnimationCurve: Curves.easeInOut,
      boxShadows: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    );

    // Pass the Payment ID back to the caller
    onPaymentSuccess(paymentId);
  }

  /// Handles payment failure
  void _handlePaymentError(PaymentFailureResponse response) {
    print("🔴 Payment Failed");
    print("❌ Error Code: ${response.code}");
    print("📝 Error Message: ${response.message}");

    Get.snackbar(
      "Payment Failed",
      "Error: ${response.message} (Code: ${response.code})",
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Handles external wallet selection
  void _handleExternalWallet(ExternalWalletResponse response) {
    print("⚠️ External Wallet Used: ${response.walletName}");

    Get.snackbar(
      "External Wallet",
      "Wallet: ${response.walletName}",
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Clears Razorpay resources when done
  void dispose() {
    _razorpay.clear();
  }
}
