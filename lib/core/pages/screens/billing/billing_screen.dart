// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:math';
//
// import 'package:scan_to_go/core/pages/screens/payment_screen/payment_screen.dart'; // Import for generating cart ID
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
// class BillingScreen extends StatefulWidget {
//   @override
//   State<BillingScreen> createState() => _BillingScreenState();
// }
//
// class _BillingScreenState extends State<BillingScreen> {
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
//           Get.to(PaymentScreen(title: ''));
//         },
//         child: Text("Proceed To Buy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }
// ----------------------- original code----------------------------



//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scan_to_go/core/pages/screens/billing/billing_controller.dart';
// import '../payment_screen/payment_screen.dart';
//
// class BillingScreen extends StatefulWidget {
//   const BillingScreen({super.key});
//
//   @override
//   State<BillingScreen> createState() => _BillingScreenState();
// }
//
// class _BillingScreenState extends State<BillingScreen> {
//   final BillingController controller = Get.put(BillingController());
//
//   @override
//   void initState() {
//     super.initState();
//     controller.getCartList(); // Fetch cart data dynamically
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Billing Details"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Obx(() => controller.loading.value
//           ? const Center(child: CircularProgressIndicator())
//           : controller.cartListInObject.value.cart == null ||
//                   controller.cartListInObject.value.cart!.isEmpty
//               ? const Center(child: Text("No cart items available."))
//               : ListView.builder(
//                   itemCount:
//                       controller.cartListInObject.value.cart?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     final cartItem =
//                         controller.cartListInObject.value.cart![index];
//                     return Card(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       elevation: 3,
//                       child: ListTile(
//                         title: Text("Item: ${cartItem.item ?? "No Item Name"}",
//                             style:
//                                 const TextStyle(fontWeight: FontWeight.bold)),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("ID: ${cartItem.id ?? "N/A"}"),
//                             Text(
//                                 "Price: ₹${cartItem.price?.toString() ?? "N/A"}"),
//                             Text(
//                                 "Quantity: ${cartItem.quantity?.toString() ?? "0"}"),
//                             Text(
//                                 "Total: ₹${cartItem.total?.toString() ?? "N/A"}"),
//                             Text("Date: ${cartItem.datetime ?? "N/A"}"),
//                             Text("Order ID: ${cartItem.orderId ?? "N/A"}"),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 )),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ElevatedButton(
//           onPressed: () {
//             Get.to(
//                 () => PaymentScreen(
//                       title: '',
//                     ),
//                 arguments: controller.totalAmount);
//           },
//           child: Text(
//               "Proceed to Payment (\₹${controller.totalAmount.toStringAsFixed(2)})"),
//         ),
//       ),
//     );
//   }
// }



//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scan_to_go/core/pages/screens/billing/billing_controller.dart';
//
// class BillingScreen extends StatefulWidget {
//   const BillingScreen({super.key});
//
//   @override
//   State<BillingScreen> createState() => _BillingScreenState();
// }
//
// class _BillingScreenState extends State<BillingScreen> {
//   final BillingController controller = Get.put(BillingController());
//
//   @override
//   void initState() {
//     super.initState();
//     controller.getCartList(); // Fetch cart data dynamically
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: const Text("Bill Summary"),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() {
//           if (controller.loading.value) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (controller.cartListInObject.value.cart == null ||
//               controller.cartListInObject.value.cart!.isEmpty) {
//             return const Center(child: Text("No cart items available."));
//           }
//
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildBillSummaryCard(),
//               const SizedBox(height: 20),
//               _buildProceedButton(),
//             ],
//           );
//         }),
//       ),
//     );
//   }
//
//   Widget _buildBillSummaryCard() {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Cart Details", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10),
//             ...controller.cartListInObject.value.cart!.map((cartItem) => _buildCartItem(cartItem)).toList(),
//             const Divider(),
//             _buildRow("Total Amount", "₹${controller.totalAmount.toStringAsFixed(2)}", isBold: true, fontSize: 18),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCartItem(cartItem) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildRow("Item", cartItem.item ?? "No Item Name"),
//           _buildRow("ID", cartItem.id ?? "N/A"),
//           _buildRow("Price", "₹${cartItem.price?.toString() ?? "N/A"}"),
//           _buildRow("Quantity", cartItem.quantity?.toString() ?? "0"),
//           _buildRow("Total", "₹${cartItem.total?.toString() ?? "N/A"}"),
//           _buildRow("Date", cartItem.datetime ?? "N/A"),
//           _buildRow("Order ID", cartItem.orderId ?? "N/A"),
//           const Divider(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRow(String label, String value, {bool isBold = false, double fontSize = 16}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//           Text(value, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProceedButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.teal,
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         onPressed: () {
//           // Simple action for now (replace with your logic)
//         },
//         child: const Text("Proceed To Buy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_to_go/core/pages/screens/billing/billing_controller.dart';
import 'package:scan_to_go/core/pages/screens/payment_screen/payment_screen.dart';
import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  final BillingController controller = Get.put(BillingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Bill Summary"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBillSummaryCard(),
                const SizedBox(height: 20),
                _buildProceedButton(),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBillSummaryCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Cart Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...?controller.cartListInObject.value.cart?.map((cart) => _buildCartItem(cart)).toList(),
            const Divider(),
            _buildWrapRow(
              "Total Amount",
              "₹${controller.totalAmount.toStringAsFixed(2)}",
              isBold: true,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(Cart cart) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWrapRow("Cart ID", cart.id ?? "N/A"),
          _buildWrapRow("Order ID", cart.orderId ?? "N/A"),
          _buildWrapRow("Date", cart.datetime ?? "N/A"),
          _buildWrapRow("Total", "₹${cart.total?.toStringAsFixed(2) ?? '0.00'}"),
          const Text("Items:", style: TextStyle(fontWeight: FontWeight.bold)),
          ...?cart.items?.map((item) => _buildItemDetails(item)).toList(),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildItemDetails(Items item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWrapRow("Item", item.item ?? "N/A"),
          _buildWrapRow("Price", "₹${item.price?.toStringAsFixed(2) ?? '0.00'}"),
          _buildWrapRow("Quantity", "${item.quantity ?? 0}"),
        ],
      ),
    );
  }

  Widget _buildWrapRow(String label, String value,
      {bool isBold = false, double fontSize = 16}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500)),
          Text(value,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildProceedButton() {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => const PaymentScreen(title: '',));
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Center(
        child: Text(
          "Proceed to Payment",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

