// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class PaymentHistoryScreen extends StatefulWidget {
//   @override
//   _PaymentHistoryScreenState createState() => _PaymentHistoryScreenState();
// }
//
// class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
//   String selectedFilter = "All"; // Default filter
//   List<Map<String, dynamic>> transactions = [
//     {"orderId": "#12345", "date": "05 Mar 2025", "amount": "₹799.00", "status": "Paid"},
//     {"orderId": "#12346", "date": "04 Mar 2025", "amount": "₹399.00", "status": "Pending"},
//     {"orderId": "#12347", "date": "03 Mar 2025", "amount": "₹1,299.00", "status": "Failed"},
//     {"orderId": "#12348", "date": "02 Mar 2025", "amount": "₹999.00", "status": "Paid"},
//     {"orderId": "#12349", "date": "01 Mar 2025", "amount": "₹499.00", "status": "Paid"},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Payment History", style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Search transactions...",
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//               onChanged: (value) {
//                 // Implement search functionality
//               },
//             ),
//           ),
//
//           // Filter Buttons
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: ["All", "Paid", "Pending", "Failed"].map((filter) {
//                 return ChoiceChip(
//                   label: Text(filter),
//                   selected: selectedFilter == filter,
//                   onSelected: (isSelected) {
//                     setState(() {
//                       selectedFilter = filter;
//                     });
//                   },
//                   selectedColor: Colors.blueAccent,
//                   backgroundColor: Colors.grey.shade200,
//                 );
//               }).toList(),
//             ),
//           ),
//
//           SizedBox(height: 10),
//
//           // Payment History List
//           Expanded(
//             child: ListView.builder(
//               itemCount: transactions.length,
//               itemBuilder: (context, index) {
//                 var transaction = transactions[index];
//
//                 // Apply filter
//                 if (selectedFilter != "All" && transaction["status"] != selectedFilter) {
//                   return SizedBox.shrink(); // Hide items that don't match the filter
//                 }
//
//                 return PaymentHistoryCard(transaction: transaction);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PaymentHistoryCard extends StatelessWidget {
//   final Map<String, dynamic> transaction;
//   PaymentHistoryCard({required this.transaction});
//
//   @override
//   Widget build(BuildContext context) {
//     Color statusColor;
//     switch (transaction["status"]) {
//       case "Paid":
//         statusColor = Colors.green;
//         break;
//       case "Pending":
//         statusColor = Colors.orange;
//         break;
//       case "Failed":
//         statusColor = Colors.red;
//         break;
//       default:
//         statusColor = Colors.grey;
//     }
//
//     return Card(
//       elevation: 4,
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(15),
//         leading: Icon(Icons.shopping_cart, size: 40, color: Colors.blueAccent),
//         title: Text(transaction["orderId"], style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(transaction["date"]),
//             Text(transaction["amount"], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
//           ],
//         ),
//         trailing: Chip(
//           label: Text(transaction["status"], style: TextStyle(color: Colors.white)),
//           backgroundColor: statusColor,
//         ),
//       ),
//     );
//   }
// }

// -------------- original code ---------------------

// ------------- code before the supabase part sunday -------------- original code ---------------------

/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class PaymentController extends GetxController {
  var paymentHistory = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDummyData();
  }

  // ✅ Adds new payment to history
  void addPayment(Map<String, dynamic> payment) {
    paymentHistory.insert(0, payment); // Adds new entry at the top
    print("✅ Payment added to history: $payment");
  }

  void _loadDummyData() {
    for (int i = 1; i <= 5; i++) {
      paymentHistory.add({
        'cartId': "CART-${Random().nextInt(999999)}",
        'date': "${Random().nextInt(28) + 1} Mar 2025, ${Random().nextInt(12) + 1}:${Random().nextInt(59).toString().padLeft(2, '0')} ${(Random().nextBool()) ? 'AM' : 'PM'}",
        'total': (Random().nextDouble() * 500 + 50).toStringAsFixed(2),
        'items': [
          {'name': "Apple", 'price': 50.0},
          {'name': "Banana", 'price': 30.0},
          {'name': "Orange", 'price': 40.0},
        ]
      });
    }
  }
}

class PaymentHistoryScreen extends StatefulWidget {
  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Payment History"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() => ListView.builder(
          itemCount: controller.paymentHistory.length,
          itemBuilder: (context, index) {
            return PaymentHistoryCard(payment: controller.paymentHistory[index]);
          },
        )),
      ),
    );
  }
}

class PaymentHistoryCard extends StatelessWidget {
  final Map<String, dynamic> payment;
  PaymentHistoryCard({required this.payment});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPaymentDetails(context, payment),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        margin: EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Cart ID: ${payment['cartId']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Order Time: ${payment['date']}"),
              SizedBox(height: 5),
              Text("Total Amount: ₹${payment['total']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentDetails(BuildContext context, Map<String, dynamic> payment) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("Payment Details"),
          content: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cart ID: ${payment['cartId']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("Order Time: ${payment['date']}"),
                SizedBox(height: 10),
                Text("Products:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ...payment['items'].map<Widget>((item) => _buildRow(item['name'], "₹${item['price']}")),
                Divider(),
                _buildRow("Total Amount", "₹${payment['total']}", isBold: true, fontSize: 18),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false, double fontSize = 16}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: Colors.black)),
        ],
      ),
    );
  }
}*/
// ------------- code before the supabase part sunday -------------- original code ---------------------

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../feature/pdf_service/pdf_helper.dart';

class PaymentController extends GetxController {
  var paymentHistory = <Map<String, dynamic>>[].obs;
  var paymentReceipt = <Map<String, dynamic>>[].obs; // ✅ Just paid receipt


  @override
  void onInit() {
    super.onInit();
    fetchUserPaymentHistory(
        Supabase.instance.client.auth.currentUser?.id); // ✅ Auto-fetch on load
  }

  // ✅ Fetch specific payment receipt by orderId and userId
  Future<void> fetchPaymentHistory({String? orderId, String? userId}) async {
    print("🔄 Fetching specific receipt by order_id & user_id...");

    if (orderId == null || userId == null) {
      print("⚠️ Missing orderId or userId");
      return;
    }

    final data = await Supabase.instance.client
        .from('cart')
        .select()
        .eq('order_id', orderId)
        .eq('user_id', userId)
        .order('datetime', ascending: false);

    if (data.isNotEmpty) {
      print("✅ Found receipt for order: $orderId");
      paymentReceipt.value = data.map((e) {
        return {
          'order_id': e['order_id'] ?? "N/A",
          'datetime': e['datetime'] ?? "N/A",
          'total': (e['total'] as num?)?.toStringAsFixed(2) ?? "0.00",
          'items': e['items'] ?? [],
          'payment_status': e['payment_status'] ?? 'N/A',
          'user_id': e['user_id'] ?? "N/A",
        };
      }).toList();
    } else {
      print("⚠️ No matching receipt found.");
      paymentReceipt.clear();
    }
  }

  // ✅ Fetch entire payment history of current user
  // Modify the fetchUserPaymentHistory method
 */
/* Future<void> fetchUserPaymentHistory(String? userId) async {
    if (userId == null) {
      print("⚠️ Cannot fetch history without userId");
      return;
    }

    print("🔄 Fetching full payment history for user: $userId");

    final data = await Supabase.instance.client
        .from('cart')
        .select()
        .eq('user_id', userId)
        .order('datetime', ascending: false); // Fetch in descending order (latest first)

    if (data.isNotEmpty) {
      print("✅ History fetched: ${data.length} records");

      final dateFormat = DateFormat("dd-MM-yyyy HH:mm:ss"); // Define the correct date format

      // Ensure data is ordered correctly
      paymentHistory.value = data
          .map((e) {
        return {
          'order_id': e['order_id'] ?? "N/A",
          'datetime': e['datetime'] ?? "N/A",
          'total': (e['total'] as num?)?.toStringAsFixed(2) ?? "0.00",
          'items': e['items'] ?? [],
          'payment_status': e['payment_status'] ?? 'N/A',
          'user_id': e['user_id'] ?? "N/A",
        };
      })
          .toList()
        ..sort((a, b) {
          final dateA = dateFormat.parse(a['datetime']);
          final dateB = dateFormat.parse(b['datetime']);
          return dateA.compareTo(dateA); // Sort by datetime descending
        });

    } else {
      print("⚠️ No history found for this user.");
      paymentHistory.clear();
    }
  }*//*


  Future<void> fetchUserPaymentHistory(String? userId) async {
    if (userId == null) {
      print("⚠️ Cannot fetch history without userId");
      return;
    }

    print("🔄 Fetching full payment history for user: $userId");

    try {
      final response = await Supabase.instance.client
          .from('cart')
          .select()
          .eq('user_id', userId);

      final data = response;

      if (data.isNotEmpty) {
        print("✅ History fetched: ${data.length} records");

        final DateFormat customFormat = DateFormat("dd-MM-yyyy HH:mm:ss");

        final sortedList = data.map((e) {
          return {
            'order_id': e['order_id'] ?? "N/A",
            'datetime': e['datetime'] ?? "N/A",
            'total': (e['total'] as num?)?.toStringAsFixed(2) ?? "0.00",
            'items': e['items'] ?? [],
            'payment_status': e['payment_status'] ?? 'N/A',
            'user_id': e['user_id'] ?? "N/A",
          };
        }).toList()
          ..sort((a, b) {
            try {
              final dateA = customFormat.parse(a['datetime']);
              final dateB = customFormat.parse(b['datetime']);
              return dateB.compareTo(dateA); // Newest first
            } catch (e) {
              print("⚠️ Date parse error: $e");
              return 0;
            }
          });

        // ✅ Reverse the list and assign Sr. No in reverse order (from total)
        for (int i = 0; i < sortedList.length; i++) {
          sortedList[i]['sr_no'] = (sortedList.length - i).toString(); // Reverse Sr. No
        }

        paymentHistory.value = sortedList;
      } else {
        print("⚠️ No history found for this user.");
        paymentHistory.clear();
      }
    } catch (e) {
      print("❌ Error fetching payment history: $e");
    }
  }




  // ✅ Add new payment
  void addPayment(Map<String, dynamic> payment) async {
    print("📝 Adding payment: $payment");

    final response =
        await Supabase.instance.client.from('cart').insert(payment);

    if (response == null) {
      print("✅ Payment added.");
      fetchUserPaymentHistory(payment['user_id']);
    } else {
      print("❌ Failed to insert payment: $response");
    }
  }
}

class PaymentHistoryScreen extends StatefulWidget {
  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Payment History"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() => ListView(
              children: [
                // ✅ Current receipt section
                if (controller.paymentReceipt.isNotEmpty) ...[
                  Text("🧾 Current Payment Receipt",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  // PaymentHistoryCard(payment: controller.paymentReceipt.first, srNo: ,),
                  PaymentHistoryCard(payment: controller.paymentReceipt.first, srNo: 0),
                  Divider(height: 32),
                ],

                // ✅ Full history section
                Text("📚 Your Payment History",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                ...controller.paymentHistory.asMap().entries.map((entry) {
                  final index = entry.key;
                  final payment = entry.value;
                  return PaymentHistoryCard(
                    payment: payment,
                    srNo: index + 1, // So it continues after current receipt
                  );
                }).toList(),// So it continues after current receipt
              ],
            )),
      ),
    );
  }
}

class PaymentHistoryCard extends StatelessWidget {
  final Map<String, dynamic> payment;
  final int srNo;

  PaymentHistoryCard({required this.payment, required this.srNo});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => _showPaymentDetails(context, payment),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        margin: EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sr. No: $srNo",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text("Order ID: ${payment['order_id']}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Order Time: ${payment['datetime']}"),
              SizedBox(height: 5),
              Text("Total Amount: ₹${payment['total']}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange)),
            ],
          ),
        ),
      ),
    );
  }
  
  void _showPaymentDetails(BuildContext context, Map<String, dynamic> payment) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("Payment Details"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order ID: ${payment['order_id']}",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("Order Time: ${payment['datetime']}"),
                SizedBox(height: 10),
                Text("Products:",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ...(payment['items'] as List? ?? []).map<Widget>((item) {
                  final itemName =
                      item['item'] ?? item['name'] ?? "Unknown Item";
                  final quantity = item['quantity'] ?? 1;
                  final price = item['price'] as num? ?? 0;

                  return _buildRow(
                    "$itemName x$quantity",
                    "₹${(price * quantity).toStringAsFixed(2)}",
                  );
                }).toList(),
                Divider(),
                _buildRow("Total Amount", "₹${payment['total']}",
                    isBold: true, fontSize: 18),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text("Close"),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.download),
              label: const Text('Download'),
              onPressed: () async {
                Navigator.pop(ctx); // Close the alert dialog (if shown)

                final orderId = payment['order_id']?.toString() ?? 'N/A';
                final dateTime = payment['datetime']?.toString() ?? DateTime.now().toIso8601String();
                final userId = payment['user_id']?.toString() ?? 'N/A';
                final total = double.tryParse(payment['total']?.toString() ?? '0') ?? 0.0;
                final items = (payment['items'] as List?)?.cast<Map<String, dynamic>>() ?? [];

                // ✅ Fetch the current logged-in user and get the name
                final user = Supabase.instance.client.auth.currentUser;
                final String name = user?.userMetadata?['name'] ?? "No Name";

                print("[DownloadReceipt] 📥 Downloading receipt for: $orderId");

                try {
                  await PDFReceiptService.createReceipt(
                    orderId: orderId,
                    items: items,
                    total: total,
                    dateTime: dateTime,
                    name: name,
                  );
                } catch (e) {
                  print("[DownloadReceipt] ❌ Error generating receipt: $e");
                }
              },
            )
          ],
        );
      },
    );
  }

  Widget _buildRow(String label, String value,
      {bool isBold = false, double fontSize = 16}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: Colors.black)),
        ],
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../feature/pdf_service/pdf_helper.dart';

class PaymentController extends GetxController {
  var paymentHistory = <Map<String, dynamic>>[].obs;
  var paymentReceipt = <Map<String, dynamic>>[].obs; // ✅ Just paid receipt

  @override
  void onInit() {
    super.onInit();
    fetchUserPaymentHistory(Supabase.instance.client.auth.currentUser?.id); // ✅ Auto-fetch on load
  }

  // ✅ Fetch specific payment receipt by orderId and userId
  Future<void> fetchPaymentHistory({String? orderId, String? userId}) async {
    print("🔄 Fetching specific receipt by order_id & user_id...");

    if (orderId == null || userId == null) {
      print("⚠️ Missing orderId or userId");
      return;
    }

    final data = await Supabase.instance.client
        .from('cart')
        .select()
        .eq('order_id', orderId)
        .eq('user_id', userId)
        .order('datetime', ascending: false);

    if (data.isNotEmpty) {
      print("✅ Found receipt for order: $orderId");
      paymentReceipt.value = data.map((e) {
        return {
          'order_id': e['order_id'] ?? "N/A",
          'datetime': e['datetime'] ?? "N/A",
          'total': (e['total'] as num?)?.toStringAsFixed(2) ?? "0.00",
          'items': e['items'] ?? [],
          'payment_status': e['payment_status'] ?? 'N/A',
          'user_id': e['user_id'] ?? "N/A",
        };
      }).toList();
    } else {
      print("⚠️ No matching receipt found.");
      paymentReceipt.clear();
    }
  }

  // ✅ Fetch entire payment history of current user
  Future<void> fetchUserPaymentHistory(String? userId) async {
    if (userId == null) {
      print("⚠️ Cannot fetch history without userId");
      return;
    }

    print("🔄 Fetching full payment history for user: $userId");

    try {
      final response = await Supabase.instance.client
          .from('cart')
          .select()
          .eq('user_id', userId);

      final data = response;

      if (data.isNotEmpty) {
        print("✅ History fetched: ${data.length} records");

        final DateFormat customFormat = DateFormat("dd-MM-yyyy HH:mm:ss");

        final sortedList = data.map((e) {
          return {
            'order_id': e['order_id'] ?? "N/A",
            'datetime': e['datetime'] ?? "N/A",
            'total': (e['total'] as num?)?.toStringAsFixed(2) ?? "0.00",
            'items': e['items'] ?? [],
            'payment_status': e['payment_status'] ?? 'N/A',
            'user_id': e['user_id'] ?? "N/A",
          };
        }).toList()
          ..sort((a, b) {
            try {
              final dateA = customFormat.parse(a['datetime']);
              final dateB = customFormat.parse(b['datetime']);
              return dateB.compareTo(dateA); // Newest first
            } catch (e) {
              print("⚠️ Date parse error: $e");
              return 0;
            }
          });

        // ✅ Reverse the list and assign Sr. No in reverse order (from total)
        for (int i = 0; i < sortedList.length; i++) {
          sortedList[i]['sr_no'] = (sortedList.length - i).toString(); // Reverse Sr. No
        }

        paymentHistory.value = sortedList;
      } else {
        print("⚠️ No history found for this user.");
        paymentHistory.clear();
      }
    } catch (e) {
      print("❌ Error fetching payment history: $e");
    }
  }

  // ✅ Add new payment
  void addPayment(Map<String, dynamic> payment) async {
    print("📝 Adding payment: $payment");

    final response =
    await Supabase.instance.client.from('cart').insert(payment);

    if (response == null) {
      print("✅ Payment added.");
      fetchUserPaymentHistory(payment['user_id']);
    } else {
      print("❌ Failed to insert payment: $response");
    }
  }
}

class PaymentHistoryScreen extends StatefulWidget {
  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Payment History"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() => ListView(
          children: [
            // ✅ Current receipt section
            if (controller.paymentReceipt.isNotEmpty) ...[
              Text("🧾 Current Payment Receipt",
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              PaymentHistoryCard(payment: controller.paymentReceipt.first, srNo: 0),
              Divider(height: 32),
            ],

            // ✅ Full history section
            Text("📚 Your Payment History",
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ...controller.paymentHistory.asMap().entries.map((entry) {
              final index = entry.key;
              final payment = entry.value;
              return PaymentHistoryCard(
                payment: payment,
                srNo: controller.paymentHistory.length - index, // So it continues after current receipt
              );
            }).toList(),
          ],
        )),
      ),
    );
  }
}

class PaymentHistoryCard extends StatelessWidget {
  final Map<String, dynamic> payment;
  final int srNo;

  PaymentHistoryCard({required this.payment, required this.srNo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPaymentDetails(context, payment),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        margin: EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sr. No: $srNo",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text("Order ID: ${payment['order_id']}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Order Time: ${payment['datetime']}"),
              SizedBox(height: 5),
              Text("Total Amount: ₹${payment['total']}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange)),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentDetails(BuildContext context, Map<String, dynamic> payment) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("Payment Details"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order ID: ${payment['order_id']}",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("Order Time: ${payment['datetime']}"),
                SizedBox(height: 10),
                Text("Products:",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ...(payment['items'] as List? ?? []).map<Widget>((item) {
                  final itemName =
                      item['item'] ?? item['name'] ?? "Unknown Item";
                  final quantity = item['quantity'] ?? 1;
                  final price = item['price'] as num? ?? 0;

                  return _buildRow(
                    "$itemName x$quantity",
                    "₹${(price * quantity).toStringAsFixed(2)}",
                  );
                }).toList(),
                Divider(),
                _buildRow("Total Amount", "₹${payment['total']}",
                    isBold: true, fontSize: 18),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text("Close"),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.download),
              label: const Text('Download'),
              onPressed: () async {
                Navigator.pop(ctx); // Close the alert dialog (if shown)

                final orderId = payment['order_id']?.toString() ?? 'N/A';
                final dateTime = payment['datetime']?.toString() ?? DateTime.now().toIso8601String();
                final userId = payment['user_id']?.toString() ?? 'N/A';
                final total = double.tryParse(payment['total']?.toString() ?? '0') ?? 0.0;
                final items = (payment['items'] as List?)?.cast<Map<String, dynamic>>() ?? [];

                // ✅ Fetch the current logged-in user and get the name
                final user = Supabase.instance.client.auth.currentUser;
                final String name = user?.userMetadata?['name'] ?? "No Name";

                print("[DownloadReceipt] 📥 Downloading receipt for: $orderId");

                try {
                  await PDFReceiptService.createReceipt(
                    orderId: orderId,
                    items: items,
                    total: total,
                    dateTime: dateTime,
                    name: name,
                  );
                } catch (e) {
                  print("[DownloadReceipt] ❌ Error generating receipt: $e");
                }
              },
            )
          ],
        );
      },
    );
  }

  Widget _buildRow(String label, String value,
      {bool isBold = false, double fontSize = 16}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: fontSize),
          ),
          Text(
            value,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
