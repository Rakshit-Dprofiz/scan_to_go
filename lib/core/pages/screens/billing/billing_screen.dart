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




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class BillingScreen extends StatefulWidget {
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
//       appBar: AppBar(title: Text("Billing Details")),
//       body: Obx(() {
//         if (controller.loading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         if (controller.cartDetails.value == null ||
//             controller.cartDetails.value!.cart == null ||
//             controller.cartDetails.value!.cart!.isEmpty) {
//           return Center(child: Text("No cart details found"));
//         }
//
//         final cart = controller.cartDetails.value!.cart!.first;
//
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("🛒 Cart ID: ${cart.id}",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text("📅 Date: ${cart.datetime}",
//                   style: TextStyle(fontSize: 16, color: Colors.grey[700])),
//               SizedBox(height: 10),
//               Text("💳 Order ID: ${cart.orderId}",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text("💰 Total: ₹${cart.total}",
//                   style: TextStyle(fontSize: 18, color: Colors.green)),
//               SizedBox(height: 20),
//               Text("🛍 Items:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: cart.items?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     final item = cart.items![index];
//                     return Card(
//                       margin: EdgeInsets.symmetric(vertical: 5),
//                       child: ListTile(
//                         title: Text(item.item ?? "Unknown Item"),
//                         subtitle: Text("Price: ₹${item.price} | Quantity: ${item.quantity}"),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'billing_controller.dart';
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
//       appBar: AppBar(title: const Text("Bill Summary"), backgroundColor: Colors.teal),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() {
//           if (controller.qrData.value.isEmpty) {
//             return const Center(child: Text("No QR data available."));
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
//             const Text("Cart Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10),
//             Text(controller.qrData.value, style: const TextStyle(fontSize: 16)),
//             const Divider(),
//           ],
//         ),
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
//           // Future functionality for payment
//         },
//         child: const Text("Proceed To Buy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'billing_controller.dart';
// import 'package:scan_to_go/core/pages/screens/payment_screen/payment_screen.dart';
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
//           if (controller.qrData.value.isEmpty) {
//             return const Center(child: Text("No QR data available."));
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
//               "🛒 Cart ID: ${controller.cartId.value}",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
//             )),
//             const SizedBox(height: 10),
//             Obx(() => Text(
//               "💰 Total: ${controller.totalAmount.value}",
//               style: const TextStyle(fontSize: 18, color: Colors.green),
//             )),
//             const SizedBox(height: 10),
//             Obx(() => Text(
//               "📅 Date & Time: ${controller.dateTime.value}",
//               style: const TextStyle(fontSize: 16, color: Colors.grey),
//             )),
//             const SizedBox(height: 10),
//             const Divider(),
//             const Text("🛍 Items:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             Obx(() => Column(
//               children: controller.items.map((item) => _buildItemCard(item)).toList(),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildItemCard(String item) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 5),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Text(
//           item,
//           style: const TextStyle(fontSize: 16),
//         ),
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


// ------------- code before the supabase part sunday




/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'billing_controller.dart';

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
          if (controller.cartId.value.isEmpty) {
            return const Center(child: Text("No QR data available."));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBillSummaryCard(),
              const Spacer(),
              _buildProceedButton(),
            ],
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
            const Text(
              "Card Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Order Time
            Obx(() => Text(
              "Order Time: ${controller.dateTime.value}",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            )),

            const SizedBox(height: 10),

            // Product Items Section
            const Text(
              "Product Items :",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),

            Obx(() => Column(
              children: controller.items.map((item) => _buildItemRow(item)).toList(),
            )),

            const Divider(),

            // Total Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Obx(() => Text(
                  "₹${controller.totalAmount.value}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item['name'],
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            "₹${item['price']}",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildProceedButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Get.to(() => const PaymentScreen(title: ''));
          Get.snackbar(
            "Coming Soon",
            "Payment feature is under development. Stay tuned!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.teal,
            colorText: Colors.white,
            duration: const Duration(seconds: 4),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          "Proceed To Pay",
          style: TextStyle(fontSize: 18, color: Colors.purple),
        ),
      ),
    );
  }
}
*/



/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../payment_screen/payment_screen.dart';
import 'billing_controller.dart';

class BillingScreen extends StatelessWidget {
  final BillingController controller = Get.put(BillingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Billing Summary'), centerTitle: true, backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBillingInfo("🛒 Trolly ID", controller.trollyId.value),
              _buildBillingInfo("📦 Order ID", controller.orderId.value),
              _buildBillingInfo("🕒 Date & Time", controller.datetime.value),
              _buildBillingInfo("💰 Total", "₹${controller.total.value.toStringAsFixed(2)}"),
              const SizedBox(height: 16),
              const Text("🛍 Items:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    var item = controller.items[index];
                    return _buildItemTile(
                      item["item"],
                       (item["price"] as num).toDouble(),
                      item["quantity"],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    final receipt = {
                      "order_id": controller.orderId.value,
                      "total": controller.total.value,
                      "items": controller.items,
                      "datetime": controller.datetime.value,
                      // You can include more if needed
                    };

                    Get.to(
                          () => PaymentScreen(
                        orderId: controller.orderId.value,
                        items: controller.items.cast<Map<String, dynamic>>().toList(),
                        amount: controller.total.value,
                      ),
                      arguments: {"current_receipt": receipt}, // ✅ Send safely
                    );
                  },


                  child: const Text("Proceed to Payment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  /// Builds a row displaying billing information.
  Widget _buildBillingInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text("$label: $value", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  /// Builds a tile for displaying each item.
  Widget _buildItemTile(String name, double price, int quantity) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text("💵 Price: ₹${price.toStringAsFixed(2)}  |  🛒 Quantity: $quantity"),
      ),
    );
  }
}*/


/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../payment_screen/payment_screen.dart';
import 'billing_controller.dart';

class BillingScreen extends StatelessWidget {
  final BillingController controller = Get.put(BillingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Bill Summary"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 4,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Card container for billing details
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order Date & Time
                    Text(
                      "Order Time: ${controller.datetime.value}",
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    // Order ID
                    Text(
                      "Order ID: ${controller.orderId.value}",
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    // const SizedBox(height: 6),

                    const SizedBox(height: 12),

                    const Text(
                      "Product Items:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    // List of items with quantity and total per item
                    ...controller.items.map((item) {
                      final String itemName = item['item'] ?? '';
                      final double price = (item['price'] as num).toDouble();
                      final int quantity = item['quantity'] ?? 1;
                      final double total = price * quantity;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$itemName (x$quantity)",
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              "₹${total.toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      );
                    }).toList(),

                    const Divider(height: 24, thickness: 1),

                    // Total Amount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Amount",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹${controller.total.value.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Proceed to Pay button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    final receipt = {
                      "order_id": controller.orderId.value,
                      "total": controller.total.value,
                      "items": controller.items,
                      "datetime": controller.datetime.value,
                    };

                    Get.to(
                          () => PaymentScreen(
                        orderId: controller.orderId.value,
                        items: controller.items.cast<Map<String, dynamic>>().toList(),
                        amount: controller.total.value,
                      ),
                      arguments: {"current_receipt": receipt},
                    );
                  },
                  child: const Text(
                    "Proceed To Pay",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../payment_screen/services/controllers/payment_controller.dart';
import 'billing_controller.dart';

class BillingScreen extends StatelessWidget {
  final BillingController controller = Get.put(BillingController());

  BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Bill Summary"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 4,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Lottie.asset(
              'assets/animation/Animation - 1744107700278.json',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Card container for billing details
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Time: ${controller.datetime.value}",
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      "Order ID: ${controller.orderId.value}",
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Product Items:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    ...controller.items.map((item) {
                      final String itemName = item['item'] ?? '';
                      final double price = (item['price'] as num).toDouble();
                      final int quantity = item['quantity'] ?? 1;
                      final double total = price * quantity;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$itemName (x$quantity)",
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              "₹${total.toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      );
                    }).toList(),

                    const Divider(height: 24, thickness: 1),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Amount",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹${controller.total.value.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Proceed to Pay button (calls Razorpay directly)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    final receipt = {
                      "order_id": controller.orderId.value,
                      "total": controller.total.value,
                      "items": controller.items,
                      "datetime": controller.datetime.value,
                    };

                    // ✅ Initialize Razorpay and open payment gateway directly
                    final razorpayService = RazorpayService(
                      onPaymentSuccess: (paymentId) {
                        print("🟢 Payment Success Callback triggered in BillingScreen!");

                        final newReceipt = {
                          "payment_id": paymentId,
                          "order_id": controller.orderId.value,
                          "total": controller.total.value,
                          "items": controller.items,
                          "datetime": DateTime.now().toIso8601String(),
                        };

                        // ✅ Navigate to PaymentHistory with current receipt
                        Get.offAllNamed("/payment-history", arguments: {
                          "current_receipt": newReceipt,
                        });
                      },
                    );

                    // 🔥 Open Razorpay directly with the amount
                    razorpayService.openPaymentGateway(controller.total.value);
                  },
                  child: const Text(
                    "Proceed To Pay",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}


// https://lottie.host/117b1bc9-ab3d-4911-9841-4f00c785873c/PMR0qb6905.lottie