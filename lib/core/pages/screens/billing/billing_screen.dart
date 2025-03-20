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


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scan_to_go/core/pages/screens/billing/billing_controller.dart';
// import 'package:scan_to_go/core/pages/screens/payment_screen/payment_screen.dart';
// import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';
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
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildBillSummaryCard(),
//                 const SizedBox(height: 20),
//                 _buildProceedButton(),
//               ],
//             ),
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
//             const Text("Cart Details",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10),
//             Obx(() => Text(
//               "🛒 Cart ID: ${controller.cartId.value.isNotEmpty ? controller.cartId.value : 'No Cart ID Found'}",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
//             )),
//             const Divider(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildWrapRow(String label, String value,
//       {bool isBold = false, double fontSize = 16}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label,
//               style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500)),
//           Text(value,
//               style: TextStyle(
//                   fontSize: fontSize,
//                   fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProceedButton() {
//     return ElevatedButton(
//       onPressed: () {
//         Get.to(() => const PaymentScreen(title: ''));
//       },
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         backgroundColor: Colors.teal,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//       child: const Center(
//         child: Text(
//           "Proceed to Payment",
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_to_go/core/pages/screens/billing/billing_controller.dart';
import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';

class BillingScreen extends StatefulWidget {
  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  final BillingController controller = Get.put(BillingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Billing Details")),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.cartDetails.value == null ||
            controller.cartDetails.value!.cart == null ||
            controller.cartDetails.value!.cart!.isEmpty) {
          return Center(child: Text("No cart details found"));
        }

        final cart = controller.cartDetails.value!.cart!.first;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("🛒 Cart ID: ${cart.id}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("📅 Date: ${cart.datetime}",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              SizedBox(height: 10),
              Text("💳 Order ID: ${cart.orderId}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("💰 Total: ₹${cart.total}",
                  style: TextStyle(fontSize: 18, color: Colors.green)),
              SizedBox(height: 20),
              Text("🛍 Items:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = cart.items![index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(item.item ?? "Unknown Item"),
                        subtitle: Text("Price: ₹${item.price} | Quantity: ${item.quantity}"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
