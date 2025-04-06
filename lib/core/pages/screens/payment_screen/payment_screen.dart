// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// // Payment Screen
// class PaymentScreen extends StatelessWidget {
//   const PaymentScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("Payment"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Proceed with your payment",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     debugPrint("Payment Successful");
//             //     Get.snackbar("Success", "Payment Successful",
//             //         snackPosition: SnackPosition.BOTTOM,
//             //         backgroundColor: Colors.green,
//             //         colorText: Colors.white);
//             //     Get.back();
//             //   },
//             //   style: ElevatedButton.styleFrom(
//             //     backgroundColor: Colors.white,
//             //     padding:
//             //         const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//             //     textStyle:
//             //         const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             //   ),
//             //   child: const Text("Pay Now",style: TextStyle(color: Colors.black),),
//             // ),
//             // SizedBox(height: 25,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 95),
//               child: GestureDetector(
//                 onTap: () {
//                   debugPrint("Payment Successful");
//                   Get.snackbar(
//                     "Success",
//                     "Payment Successful",
//                     snackPosition: SnackPosition.BOTTOM,
//                     backgroundColor: Colors.green,
//                     colorText: Colors.white,
//                   );
//                   Get.back();
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.grey,
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Pay Now",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});
//
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   final RazorpayService _razorpayService = RazorpayService();
//
//   @override
//   void initState() {
//     super.initState();
//     _razorpayService.initialize(); // Ensure Razorpay is initialized
//   }
//
//   @override
//   void dispose() {
//     _razorpayService.dispose(); // Clean up Razorpay resources
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: const Text("Payment"), centerTitle: true),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Proceed with your payment",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 95),
//               child: GestureDetector(
//                 onTap: () {
//                   _razorpayService.openCheckout(50); // Example amount in INR
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.grey,
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Pay Now",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});
//
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: const Text("Payment"), centerTitle: true),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Proceed with your payment",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 95),
//               child: GestureDetector(
//                 onTap: () {
//
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.grey,
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Pay Now",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// // Payment Controller using GetX for state management
// class PaymentController extends GetxController {
//   // List of purchased products (dynamic and scalable)
//   var productItems = <Map<String, dynamic>>[].obs;
//
//   // Order details
//   var timeStamp = DateTime.now().obs;
//   var totalPrice = 0.0.obs;
//
//   // Function to add product to the list dynamically
//   void addProduct(String name, double price) {
//     productItems.add({'name': name, 'price': price});
//     calculateTotal();
//   }
//
//   // Function to calculate total price dynamically
//   void calculateTotal() {
//     totalPrice.value = productItems.fold(0, (sum, item) => sum + item['price']);
//   }
// }
//
// class PaymentScreen extends StatefulWidget {
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   final PaymentController controller = Get.put(PaymentController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Bill Summary"),
//         backgroundColor: Colors.teal,
//       ),
//       body: Container(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Obx(() => Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Card Details",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   _buildBillSummaryCard(),
//                   // SizedBox(height: 10),
//                   SizedBox(height: 20),
//                   _buildProceedButton(),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBillSummaryCard() {
//     return Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 3,
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Order Time: ${controller.timeStamp.value}"),
//             SizedBox(height: 10),
//             Text("Product Items :",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             ...controller.productItems.map((product) =>
//                 _buildRow(product['name'], "₹${product['price']}")),
//             Divider(),
//             _buildRow(
//                 "Total Amount", "₹${controller.totalPrice.toStringAsFixed(2)}",
//                 isBold: true, fontSize: 18),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRow(String label, String value,
//       {bool isBold = false, Color color = Colors.black, double fontSize = 16}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label,
//               style: TextStyle(
//                   fontSize: fontSize,
//                   fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//           Text(value,
//               style: TextStyle(
//                   fontSize: fontSize,
//                   fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//                   color: color)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProceedButton() {
//     return Container(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.teal,
//           padding: EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         onPressed: () {
//           Get.snackbar("Order", "Proceeding to buy...",
//               snackPosition: SnackPosition.BOTTOM,
//               backgroundColor: Colors.green,
//               colorText: Colors.white);
//         },
//         child: Text("Proceed To Pay",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// // Product Model
// class Product {
//   final String name;
//   final double price;
//
//   Product({required this.name, required this.price});
// }
//
// // Payment Controller using GetX for state management
// class PaymentController extends GetxController {
//   // List of purchased products (dynamic and scalable)
//   var productItems = <Product>[].obs;
//
//   // Order details
//   var timeStamp = DateTime.now().obs;
//   var totalPrice = 0.0.obs;
//
//   // Function to add product to the list dynamically
//   void addProduct(String name, double price) {
//     productItems.add(Product(name: name, price: price));
//     calculateTotal();
//   }
//
//   // Function to calculate total price dynamically
//   void calculateTotal() {
//     totalPrice.value = productItems.fold(0, (sum, item) => sum + item.price);
//   }
//
//   // Function to format date & time manually
//   String getFormattedDateTime() {
//     final DateTime dateTime = timeStamp.value;
//     String day = dateTime.day.toString().padLeft(2, '0');
//     String month = _getMonthName(dateTime.month);
//     String year = dateTime.year.toString();
//     String hour = (dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12).toString().padLeft(2, '0');
//     String minute = dateTime.minute.toString().padLeft(2, '0');
//     String amPm = dateTime.hour >= 12 ? 'PM' : 'AM';
//
//     return "$day $month $year, $hour:$minute $amPm";
//   }
//
//   // Function to get month name from number
//   String _getMonthName(int month) {
//     const months = [
//       "Jan", "Feb", "Mar", "Apr", "May", "Jun",
//       "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
//     ];
//     return months[month - 1];
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // Adding dummy products when the controller initializes
//     addProduct("Apple", 50.0);
//     addProduct("Banana", 20.0);
//     addProduct("Orange", 30.0);
//     addProduct("Grapes", 40.0);
//     addProduct("Mango", 60.0);
//   }
// }
//
// class PaymentScreen extends StatefulWidget {
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   final PaymentController controller = Get.put(PaymentController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Bill Summary"),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Obx(() => Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Card Details",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             _buildBillSummaryCard(),
//             SizedBox(height: 20),
//             _buildProceedButton(),
//           ],
//         )),
//       ),
//     );
//   }
//
//   Widget _buildBillSummaryCard() {
//     return Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 3,
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Order Time: ${controller.getFormattedDateTime()}"),
//             SizedBox(height: 10),
//             Text("Product Items :",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             ...controller.productItems.map((product) =>
//                 _buildRow(product.name, "₹${product.price}")),
//             Divider(),
//             _buildRow(
//                 "Total Amount", "₹${controller.totalPrice.toStringAsFixed(2)}",
//                 isBold: true, fontSize: 18),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRow(String label, String value,
//       {bool isBold = false, Color color = Colors.black, double fontSize = 16}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label,
//               style: TextStyle(
//                   fontSize: fontSize,
//                   fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//           Text(value,
//               style: TextStyle(
//                   fontSize: fontSize,
//                   fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//                   color: color)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProceedButton() {
//     return Container(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.teal,
//           padding: EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         onPressed: () {
//           Get.snackbar("Order", "Proceeding to buy...",
//               snackPosition: SnackPosition.BOTTOM,
//               backgroundColor: Colors.green,
//               colorText: Colors.white);
//         },
//         child: Text("Proceed To Pay",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }

//----------------------------------------------------------------

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:math'; // Import for generating cart ID
//
// // Payment Controller using GetX for state management
// class PaymentController extends GetxController {
//   // List of purchased products (dynamic and scalable)
//   var productItems = <Map<String, dynamic>>[].obs;
//
//   // Order details
//   var timeStamp = DateTime.now().obs;
//   var totalPrice = 0.0.obs;
//   var cartId = ''.obs; // Cart ID
//
//   // Function to generate a unique cart ID
//   String generateCartId() {
//     return "CART-${Random().nextInt(999999)}";
//   }
//
//   // Function to add product to the list dynamically
//   void addProduct(String name, double price) {
//     if (cartId.value.isEmpty) {
//       cartId.value = generateCartId(); // Assign cart ID only once per session
//     }
//     productItems.add({'cartId': cartId.value, 'name': name, 'price': price});
//     calculateTotal();
//   }
//
//   // Function to calculate total price dynamically
//   void calculateTotal() {
//     totalPrice.value = productItems.fold(0, (sum, item) => sum + item['price']);
//   }
//
//   // Adding dummy data for testing
//   void addDummyData() {
//     addProduct("Apple", 50.0);
//     addProduct("Banana", 30.0);
//     addProduct("Orange", 40.0);
//   }
// }
//
// class PaymentScreen extends StatefulWidget {
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   final PaymentController controller = Get.put(PaymentController());
//
//   @override
//   void initState() {
//     super.initState();
//     controller.addDummyData(); // Load dummy data
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Bill Summary"),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Obx(() => Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildBillSummaryCard(),
//             SizedBox(height: 20),
//             _buildProceedButton(),
//           ],
//         )),
//       ),
//     );
//   }
//
//   Widget _buildBillSummaryCard() {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 3,
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Cart ID: ${controller.cartId.value}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             SizedBox(height: 5),
//             Text("Order Time: ${controller.timeStamp.value.day.toString().padLeft(2, '0')} "
//                 "${_getMonthName(controller.timeStamp.value.month)} "
//                 "${controller.timeStamp.value.year}, "
//                 "${(controller.timeStamp.value.hour % 12 == 0 ? 12 : controller.timeStamp.value.hour % 12).toString().padLeft(2, '0')}:"
//                 "${controller.timeStamp.value.minute.toString().padLeft(2, '0')} "
//                 "${controller.timeStamp.value.hour >= 12 ? 'PM' : 'AM'}"),
//             SizedBox(height: 10),
//             Text("Products:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             ...controller.productItems.map((product) => _buildRow("${product['name']}", "₹${product['price']}")),
//             Divider(),
//             _buildRow("Total Amount", "₹${controller.totalPrice.toStringAsFixed(2)}", isBold: true, fontSize: 18),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String _getMonthName(int month) {
//     const months = [
//       "Jan", "Feb", "Mar", "Apr", "May", "Jun",
//       "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
//     ];
//     return months[month - 1];
//   }
//
//   Widget _buildRow(String label, String value, {bool isBold = false, Color color = Colors.black, double fontSize = 16}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//           Text(value, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProceedButton() {
//     return Container(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.teal,
//           padding: EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         onPressed: () {
//           Get.snackbar("Order", "Proceeding to buy...", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
//         },
//         child: Text("Proceed To Buy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }


// ==================== original code ====================

/*import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.title});

  final String title;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pay with Razorpay',
            ),
            ElevatedButton(
                onPressed: () {
                  Razorpay razorpay = Razorpay();
                  var options = {
                    'key': 'rzp_test_00c36kD21CoCL3',
                    'amount': 100 * 100,
                    'name': 'Acme Corp.',
                    'description': 'Fine T-Shirt',
                    'retry': {'enabled': true, 'max_count': 1},
                    'send_sms_hash': true,
                    'prefill': {
                      'contact': '8888888888',
                      'email': 'test@razorpay.com'
                    },
                    'external': {
                      'wallets': ['paytm']
                    }
                  };
                  razorpay.on(
                      Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                      handlePaymentSuccessResponse);
                  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                      handleExternalWalletSelected);
                  razorpay.open(options);
                },
                child: const Text("Pay with Razorpay")),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
 *//* PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    *//*


    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    // * Payment Success Response contains three values:
    // * 1. Order ID
    // * 2. Payment ID
    // * 3. Signature
    // *

    showAlertDialog(
      context,
      "Payment Successful",
      "Payment ID: ${response.paymentId}",
    );
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}*/

// ==================== original code ====================


//
// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   late Razorpay _razorpay; // Declare Razorpay instance
//
//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//
//     // Listen for Razorpay events
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
//   }
//
//   @override
//   void dispose() {
//     _razorpay.clear(); // Dispose Razorpay instance when screen is closed
//     super.dispose();
//   }
//
//   void startPayment() {
//     var options = {
//       'key': 'rzp_test_00c36kD21CoCL3', // Test mode API key
//       'amount': 100 * 100, // Amount in paise (₹1.00)
//       'currency': 'INR',
//       'name': 'Acme Corp.',
//       'description': 'Fine T-Shirt',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {
//         'contact': '8888888888',
//         'email': 'test@razorpay.com',
//       },
//       'external': {
//         'wallets': ['paytm'],
//       }
//     };
//
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint("Error: $e");
//     }
//   }
//
//   void handlePaymentErrorResponse(PaymentFailureResponse response) {
//     debugPrint("Payment Failed: ${response.message}");
//     showAlertDialog(
//       context,
//       "Payment Failed",
//       "Code: ${response.code}\nDescription: ${response.message}\nMetadata: ${response.error.toString()}",
//     );
//   }
//
//   void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
//     debugPrint("Payment Success: ${response.paymentId}");
//     showAlertDialog(
//       context,
//       "Payment Successful",
//       "Payment ID: ${response.paymentId}",
//     );
//   }
//
//   void handleExternalWalletSelected(ExternalWalletResponse response) {
//     debugPrint("External Wallet Selected: ${response.walletName}");
//     showAlertDialog(
//       context,
//       "External Wallet Selected",
//       "Wallet: ${response.walletName}",
//     );
//   }
//
//   void showAlertDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('Pay with Razorpay'),
//             ElevatedButton(
//               onPressed: startPayment,
//               child: const Text("Pay with Razorpay"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// payment code is commented
/*
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.title});

  final String title;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pay with Razorpay',
            ),
            ElevatedButton(
                onPressed: () {
                  Razorpay razorpay = Razorpay();
                  var options = {
                    'key': 'rzp_test_00c36kD21CoCL3',
                    'amount': 100 * 100,
                    'name': 'Acme Corp.',
                    'description': 'Fine T-Shirt',
                    'retry': {'enabled': true, 'max_count': 1},
                    'send_sms_hash': true,
                    'prefill': {
                      'contact': '8888888888',
                      'email': 'test@razorpay.com'
                    },
                    'external': {
                      'wallets': ['paytm']
                    }
                  };
                  razorpay.on(
                      Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                      handlePaymentSuccessResponse);
                  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                      handleExternalWalletSelected);
                  razorpay.open(options);
                },
                child: const Text("Pay with Razorpay")),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    */
/* * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * *//*


    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    // * Payment Success Response contains three values:
    // * 1. Order ID
    // * 2. Payment ID
    // * 3. Signature
    // *

    showAlertDialog(
      context,
      "Payment Successful",
      "Payment ID: ${response.paymentId}",
    );
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}*/


// new

// working code
// import 'package:flutter/material.dart';
// import 'package:scan_to_go/core/pages/screens/payment_screen/services/controllers/payment_controller.dart';
//
// class PaymentScreen extends StatelessWidget {
//   final RazorpayService _razorpayService = RazorpayService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Payment")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _razorpayService.openPaymentGateway(500); // Example ₹500 payment
//           },
//           child: Text("Pay ₹500"),
//         ),
//       ),
//     );
//   }
// }
// working code

// // PaymentScreen.dart




// 6/4/25
/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../billing/billing_controller.dart';
import 'services/controllers/payment_controller.dart'; // if needed

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late RazorpayService _razorpayService;
  final BillingController billingController = Get.find<BillingController>();
  String? transactionId;
  // String orderId; // ✅ Define orderId variable

  @override
  void initState() {
    super.initState();
    _razorpayService = RazorpayService(
      onPaymentSuccess: (paymentId) {
        setState(() {
          transactionId = paymentId;
        });

        if (paymentId != null) {
          print("✅ Successfully received Payment ID: $paymentId");
        } else {
          print("⚠️ Payment completed but Payment ID is null");
        }
      },
    );
  }

  @override
  void dispose() {
    _razorpayService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double amount = billingController.total.value;
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            transactionId != null
                ? Text("Payment Successful! ID: $transactionId")
                : Text("No Payment Yet"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (amount > 0) {
                  _razorpayService.openPaymentGateway(amount);


                  String orderId = billingController.orderId.value;
                  // _razorpayService.openPaymentGateway(amount, orderId);


                  print("💰 Amount Passed: ₹$amount");
                  // print("💰 order Id: ₹$orderId ");

                    Razorpay razorpay = Razorpay();

                    var options = {
                      'key': 'rzp_test_kz6NrKGGxbnS9n',
                      'amount': 100,
                      'name': 'Acme Corp.',
                      'description': 'Fine T-Shirt',
                      'retry': {'enabled': true, 'max_count': 1},
                      'send_sms_hash': true,
                      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                      'external': {
                        'wallets': ['paytm']
                      }
                    };
                    // razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                    // razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
                    // razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
                    razorpay.open(options);


                } else {
                  Get.snackbar(
                    "Error",
                    "Invalid payment amount",
                    backgroundColor: Colors.red,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text("Pay ₹${amount.toStringAsFixed(2)}"),
            ),
          ],
        ),
      ),
    );
  }
}
*/


// lib/feature/payment_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:scan_to_go/feature/supabase_service.dart';
import '../payment_history/page/payment_history_screen.dart';
import 'services/controllers/payment_controller.dart';

class PaymentScreen extends StatefulWidget {
  final double amount;
  final String orderId;
  final List<Map<String, dynamic>> items;

  const PaymentScreen({
    Key? key,
    required this.amount,
    required this.orderId,
    required this.items,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late RazorpayService _razorpayService;
  final SupabaseService _supabaseService = SupabaseService();

  @override
  void initState() {
    super.initState();
    _razorpayService = RazorpayService(onPaymentSuccess: _handlePaymentSuccess);
  }

  /// ✅ Unified payment success handler
  void _handlePaymentSuccess(String paymentId) async {
    print("✅ Razorpay Payment Success! ID: $paymentId");

    try {
      print("📥 Inserting order into Supabase...");
      await _supabaseService.insertCartData(
        orderId: widget.orderId,
        items: widget.items,
        total: widget.amount,
        datetime: DateTime.now().toIso8601String(),
      );
      print("✅ Order inserted successfully.");

      print("🔍 Fetching billing data from Supabase...");
      final billingData = await _supabaseService.getBillingHistoryByUser(widget.orderId); // 🔁 Fixed line

      if (billingData != null) {
        print("📦 Billing data retrieved. Navigating to PaymentHistoryScreen...");
        Get.to(() => PaymentHistoryScreen(), arguments: {
          'current_receipt': billingData,
        });
      } else {
        print("⚠️ No billing data found for order_id: ${widget.orderId}");
        Get.snackbar("Error", "Payment saved, but billing info not found.");
      }
    } catch (e) {
      print("❌ Error during payment handling: $e");
      Get.snackbar("Error", "Something went wrong during payment.");
    }
  }

  @override
  void dispose() {
    _razorpayService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Proceed to Pay")),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            print("💰 Opening Razorpay payment gateway...");
            _razorpayService.openPaymentGateway(widget.amount);
          },
          icon: const Icon(Icons.payment),
          label: const Text("Pay Now"),
        ),
      ),
    );
  }
}

