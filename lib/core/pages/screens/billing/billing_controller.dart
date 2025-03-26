// import 'package:get/get.dart';
// import '../../../../feature/api_services/model/user_list_in_object.dart';
// import '../../../../feature/api_services/network_manager/rest_client.dart';
// import '../../../../feature/supabase_service.dart'; // Import SupabaseService
//
// class BillingController extends GetxController {
//   var cartListInObject = CartListInObject(cart: []).obs;
//   var loading = true.obs;
//   final SupabaseService _supabaseService = SupabaseService();
//
//   @override
//   void onInit() {
//     super.onInit();
//     getCartList();
//   }
//
//   // Fetch cart details
//   void getCartList() async {
//     try {
//       loading.value = true;
//
//       // ✅ First, fetch and log the UUID
//       String? userId = await _supabaseService.fetchUserUUID();
//       if (userId == null) {
//         throw Exception("User UUID not found.");
//       }
//       print("🔍 Fetching cart for User ID: $userId");
//
//       // ✅ Then, fetch and log the Cart ID
//       String? cartId = await _supabaseService.fetchCartId();
//       if (cartId == null) {
//         throw Exception("No cart ID found for the user.");
//       }
//
//       print("🛒 Fetching cart with ID: $cartId");
//
//       cartListInObject.value = await RestClient.getCartListInObject(cartId);
//     } catch (error) {
//       print('❌ Error fetching cart: ${error.toString()}');
//     } finally {
//       loading.value = false;
//     }
//   }
//
//   // ✅ Add the totalAmount getter
//   double get totalAmount {
//     if (cartListInObject.value.cart == null || cartListInObject.value.cart!.isEmpty) {
//       return 0.0;
//     }
//
//     return cartListInObject.value.cart!.fold<double>(
//       0.0,
//           (sum, cart) => sum + (cart.total?.toDouble() ?? 0.0),
//     );
//   }
// }


//------------working
// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class BillingController extends GetxController {
//   final SupabaseClient supabase = Supabase.instance.client;
//
//   var cartId = ''.obs;  // Holds the fetched cart ID
//   var loading = false.obs;
//   var qrData = ''.obs;  // Holds the QR data passed in
//
//   @override
//   void onInit() {
//     // Get the QR data from arguments
//     if (Get.arguments != null && Get.arguments['qrData'] != null) {
//       qrData.value = Get.arguments['qrData'];
//       print("📱 QR Data received: ${qrData.value}");
//     } else {
//       print("⚠️ No QR data received");
//     }
//
//     // Only fetch the cart (do not create one if it doesn't exist)
//     fetchCartByOrderId();
//     super.onInit();
//   }
//
//   /// Fetch the existing cart that has an order_id matching the QR data.
//   Future<void> fetchCartByOrderId() async {
//     try {
//       loading.value = true;
//       print("🔄 Checking if cart exists with order_id: ${qrData.value}");
//       final existingCart = await supabase
//           .from('cart_details')
//           .select('id')
//           //.eq('order_id', qrData.value)
//           .limit(1);
//
//       print("🔍 Existing cart response: $existingCart");
//
//       if (existingCart is List && existingCart.isNotEmpty && existingCart[0]['id'] != null) {
//         // Cart exists; store its ID
//         cartId.value = existingCart[0]['id'];
//         print("✅ Found existing cart with ID: ${cartId.value}");
//       } else {
//         print("❌ No existing cart found with order_id: ${qrData.value}");
//       }
//     } catch (error) {
//       print("🚨 Error fetching cart: $error");
//     } finally {
//       loading.value = false;
//     }
//   }
// }



// working 2
// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class BillingController extends GetxController {
//   final SupabaseClient supabase = Supabase.instance.client;
//
//   var cartId = ''.obs;
//   var loading = false.obs;
//   var qrData = ''.obs;  // Holds the encrypted QR data
//
//   @override
//   void onInit() {
//     if (Get.arguments != null && Get.arguments['qrData'] != null) {
//       qrData.value = Get.arguments['qrData'];
//       print("📱 Encrypted QR Data received: ${qrData.value}");
//     } else {
//       print("⚠️ No QR data received");
//     }
//
//     // Fetch cart using encrypted QR data
//     fetchCartByEncryptedQR();
//     super.onInit();
//   }
//
//   Future<void> fetchCartByEncryptedQR() async {
//     if (qrData.value.isEmpty) {
//       print("❌ No valid QR data available");
//       return;
//     }
//
//     try {
//       loading.value = true;
//       print("🔄 Fetching cart using encrypted QR value...");
//
//       final existingCart = await supabase
//           .from('cart_details')
//           .select('id')
//           .eq('string', qrData.value)  // Query using the `string` column
//           .limit(1);
//
//       print("🔍 Supabase response: $existingCart");
//
//       if (existingCart is List && existingCart.isNotEmpty && existingCart[0]['id'] != null) {
//         cartId.value = existingCart[0]['id'];
//         print("✅ Found cart with ID: ${cartId.value}");
//       } else {
//         print("❌ No cart found for string: ${qrData.value}");
//       }
//     } catch (error) {
//       print("🚨 Error fetching cart: $error");
//     } finally {
//       loading.value = false;
//     }
//   }
// }




// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';
// import '../../../../feature/api_services/network_manager/rest_client.dart';
//
// class BillingController extends GetxController {
//   final SupabaseClient supabase = Supabase.instance.client;
//
//   var cartId = ''.obs;
//   var loading = false.obs;
//   var qrData = ''.obs;
//   var cartDetails = Rxn<CartListInObject>(); // Holds API response
//
//   @override
//   void onInit() {
//     if (Get.arguments != null && Get.arguments['qrData'] != null) {
//       qrData.value = Get.arguments['qrData'];
//       print("📱 Encrypted QR Data received: ${qrData.value}");
//     } else {
//       print("⚠️ No QR data received");
//     }
//
//     fetchCartByEncryptedQR();
//     super.onInit();
//   }
//
//   Future<void> fetchCartByEncryptedQR() async {
//     if (qrData.value.isEmpty) {
//       print("❌ No valid QR data available");
//       return;
//     }
//
//     try {
//       loading.value = true;
//       print("🔄 Fetching cart using encrypted QR value...");
//
//       final existingCart = await supabase
//           .from('cart_details')
//           .select('id')
//           .eq('string', qrData.value)
//           .limit(1);
//
//       print("🔍 Supabase response: $existingCart");
//
//       if (existingCart is List && existingCart.isNotEmpty && existingCart[0]['id'] != null) {
//         cartId.value = existingCart[0]['id'];
//         print("✅ Found cart with ID: ${cartId.value}");
//
//         // Fetch cart details from API using cartId
//         await fetchCartDetails();
//       } else {
//         print("❌ No cart found for string: ${qrData.value}");
//       }
//     } catch (error) {
//       print("🚨 Error fetching cart: $error");
//     } finally {
//       loading.value = false;
//     }
//   }
//
//   Future<void> fetchCartDetails() async {
//     if (cartId.value.isEmpty) {
//       print("⚠️ No cartId available, cannot fetch cart details.");
//       return;
//     }
//
//     try {
//       print("📡 Calling API to fetch cart details...");
//       final cartData = await RestClient.getCartListInObject(cartId.value);
//       cartDetails.value = cartData;
//       print("✅ Cart details fetched successfully.");
//     } catch (error) {
//       print("🚨 Error fetching cart details: $error");
//     }
//   }
// }



// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';
// import '../../../../feature/api_services/network_manager/rest_client.dart';
//
// class BillingController extends GetxController {
//   final SupabaseClient supabase = Supabase.instance.client;
//
//   var cartId = ''.obs;
//   var loading = false.obs;
//   var qrData = ''.obs;
//   var cartDetails = Rxn<CartListInObject>(); // Holds API response
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     if (Get.arguments != null && Get.arguments['qrData'] != null) {
//       qrData.value = Get.arguments['qrData'];
//       print("📱 Encrypted QR Data received: ${qrData.value}");
//     } else {
//       print("⚠️ No QR data received.");
//     }
//
//     fetchCartByEncryptedQR();
//   }
//
//   Future<void> fetchCartByEncryptedQR() async {
//     if (qrData.value.isEmpty) {
//       print("❌ No valid QR data available.");
//       return;
//     }
//
//     try {
//       loading.value = true;
//       print("🔄 Fetching cart using encrypted QR value...");
//
//       final existingCart = await supabase
//           .from('cart_details')
//           .select('id')
//           .eq('string', qrData.value)
//           .limit(1)
//           .maybeSingle();
//
//       if (existingCart != null && existingCart['id'] != null) {
//         cartId.value = existingCart['id'];
//         print("✅ Found cart with ID: ${cartId.value}");
//
//         // Fetch cart details from API using cartId
//         await fetchCartDetails();
//       } else {
//         print("❌ No cart found for string: ${qrData.value}");
//       }
//     } catch (error, stackTrace) {
//       print("🚨 Error fetching cart: $error");
//       print(stackTrace);
//     } finally {
//       loading.value = false;
//     }
//   }
//
//   Future<void> fetchCartDetails() async {
//     if (cartId.value.isEmpty) {
//       print("⚠️ No cartId available, cannot fetch cart details.");
//       return;
//     }
//
//     try {
//       print("📡 Calling API to fetch cart details...");
//       final cartData = await RestClient.getCartListInObject(cartId.value);
//
//       if (cartData != null) {
//         cartDetails.value = cartData;
//         print("✅ Cart details fetched successfully.");
//       } else {
//         print("❌ Cart details returned null.");
//       }
//     } catch (error, stackTrace) {
//       print("🚨 Error fetching cart details: $error");
//       print(stackTrace);
//     }
//   }
// }





// import 'package:get/get.dart';
//
// class BillingController extends GetxController {
//   var qrData = ''.obs;
//
//   @override
//   void onInit() {
//     if (Get.arguments != null && Get.arguments['qrData'] != null) {
//       qrData.value = Get.arguments['qrData'];
//       print("📱 Scanned QR Data received: ${qrData.value}");
//     } else {
//       print("⚠️ No QR data received");
//     }
//     super.onInit();
//   }
// }


//
// import 'package:get/get.dart';
//
// class BillingController extends GetxController {
//   var qrData = ''.obs;
//   var cartId = ''.obs;
//   var totalAmount = ''.obs;
//   var dateTime = ''.obs;
//   var items = <String>[].obs;
//
//   @override
//   void onInit() {
//     if (Get.arguments != null && Get.arguments['qrData'] != null) {
//       qrData.value = Get.arguments['qrData'];
//       print("📱 Scanned QR Data received: ${qrData.value}");
//
//       _extractCartDetails(qrData.value);
//     } else {
//       print("⚠️ No QR data received");
//     }
//     super.onInit();
//   }
//
//   void _extractCartDetails(String data) {
//     List<String> lines = data.split('\n');
//
//     for (var line in lines) {
//       if (line.startsWith("Cart Id:")) {
//         cartId.value = line.split(":")[1].trim();
//       } else if (line.startsWith("Total:")) {
//         totalAmount.value = line.split(":")[1].trim();
//       } else if (line.startsWith("Date & Time:")) {
//         dateTime.value = line.split(":")[1].trim();
//       } else if (line.contains(" - Rs.")) {
//         items.add(line);
//       }
//     }
//
//     if (cartId.value.isEmpty) {
//       cartId.value = "Unknown";
//     }
//
//     print("🛒 Extracted Cart ID: ${cartId.value}");
//     print("🛍 Items: ${items.toList()}");
//     print("💰 Total: ${totalAmount.value}");
//     print("⏳ Date & Time: ${dateTime.value}");
//   }
// }




// ------------- code before the supabase part sunday

import 'package:get/get.dart';

class BillingController extends GetxController {
  var cartId = ''.obs;
  var totalAmount = ''.obs;
  var dateTime = ''.obs;
  var items = <Map<String, dynamic>>[].obs; // List of item maps

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['qrData'] != null) {
      parseQRData(Get.arguments['qrData']);
    } else {
      print("⚠️ No QR data received");
    }
  }

  void parseQRData(String qrData) {
    print("📱 Scanned QR Data received:\n$qrData");

    List<String> lines = qrData.split("\n");
    String? lastItemName;
    String? lastItemPrice;

    for (var line in lines) {
      line = line.trim();

      if (line.startsWith("Cart Id:")) {
        cartId.value = line.split(":")[1].trim();
      } else if (line.startsWith("Total:")) {
        totalAmount.value = line.split(":")[1].trim();
      } else if (line.startsWith("Date & Time:")) {
        dateTime.value = line.split(":")[1].trim();
      } else if (line.contains(" - Rs.")) {
        // Extract product name and price
        List<String> parts = line.split(" - Rs.");
        lastItemName = parts[0].trim();
        lastItemPrice = parts[1].trim();
      } else if (line.startsWith("Quantity-") && lastItemName != null && lastItemPrice != null) {
        // Extract quantity and store the item
        String quantity = line.split("-")[1].trim();
        items.add({
          "name": lastItemName,
          "price": lastItemPrice,
          "quantity": quantity,
        });

        // Reset for next item
        lastItemName = null;
        lastItemPrice = null;
      }
    }

    // Ensure default values if data is missing
    if (cartId.isEmpty) cartId.value = "Unknown";
    if (totalAmount.isEmpty) totalAmount.value = "N/A";
    if (dateTime.isEmpty) dateTime.value = "N/A";

    // Print extracted values for debugging
    print("🛒 Extracted Cart ID: ${cartId.value}");
    print("💰 Total Amount: ${totalAmount.value}");
    print("📅 Date & Time: ${dateTime.value}");
    print("🛍 Items List:");
    for (var item in items) {
      print("   - ${item['name']} | Price: Rs. ${item['price']} | Quantity: ${item['quantity']}");
    }
  }
}

// ------------- code before the supabase part sunday--------------------------






// new supabase code
/*

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BillingController extends GetxController {
  var cartId = ''.obs;
  var totalAmount = ''.obs;
  var dateTime = ''.obs;
  var items = <Map<String, dynamic>>[].obs; // List of item maps

  final SupabaseClient supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['qrData'] != null) {
      parseQRData(Get.arguments['qrData']);
    } else {
      print("⚠️ No QR data received");
    }
  }

  void parseQRData(String qrData) async {
    print("📱 Scanned QR Data received:\n$qrData");

    List<String> lines = qrData.split("\n");
    String? lastItemName;
    String? lastItemPrice;

    for (var line in lines) {
      line = line.trim();

      if (line.startsWith("Cart Id:")) {
        cartId.value = line.split(":")[1].trim();
      } else if (line.startsWith("Total:")) {
        totalAmount.value = line.split(":")[1].replaceAll("Rs.", "").trim();
      } else if (line.startsWith("Date & Time:")) {
        String extractedDate = line.replaceFirst("Date & Time:", "").trim();

        try {
          // Convert "21-03-2025 12:28:31" → "2025-03-21 12:28:31"
          List<String> dateParts = extractedDate.split(" ");
          List<String> dmy = dateParts[0].split("-");
          String formattedDate = "${dmy[2]}-${dmy[1]}-${dmy[0]} ${dateParts[1]}";

          dateTime.value = formattedDate; // ✅ Correct format for Supabase
        } catch (e) {
          print("⚠️ Date formatting error: $e");
          dateTime.value = "Invalid Date";
        }
      } else if (line.contains(" - Rs.")) {
        List<String> parts = line.split(" - Rs.");
        lastItemName = parts[0].trim();
        lastItemPrice = parts[1].trim();
      } else if (line.startsWith("Quantity-") && lastItemName != null && lastItemPrice != null) {
        String quantity = line.split("-")[1].trim();
        items.add({
          "name": lastItemName,
          "price": lastItemPrice,
          "quantity": quantity,
        });

        lastItemName = null;
        lastItemPrice = null;
      }
    }

    // Default values if missing
    if (cartId.isEmpty) cartId.value = "Unknown";
    if (totalAmount.isEmpty) totalAmount.value = "0.0";
    if (dateTime.value == "Invalid Date") {
      print("❌ Error: Invalid Date Format Detected");
      return;
    }

    // Print extracted values for debugging
    print("🛒 Extracted Cart ID: ${cartId.value}");
    print("💰 Total Amount: ${totalAmount.value}");
    print("📅 Date & Time: ${dateTime.value}");
    print("🛍 Items List:");
    for (var item in items) {
      print("   - ${item['name']} | Price: Rs. ${item['price']} | Quantity: ${item['quantity']}");
    }

    // ✅ Insert into Supabase
    await insertIntoSupabase();
  }

  Future<void> insertIntoSupabase() async {
    try {
      final response = await supabase.from('cart_details').insert({
        'order_id': cartId.value,
        'items': items,
        'total': double.tryParse(totalAmount.value) ?? 0.0,
        'datetime': dateTime.value, // ✅ Correctly formatted timestamp
      });

      print("✅ Data inserted into Supabase successfully.");
    } catch (e) {
      print("❌ Error inserting data into Supabase: $e");
    }
  }
}*/


// ----------------------------------------------------------------------------

/*import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../payment_history/page/payment_history_screen.dart';

class BillingController extends GetxController {
  var cartId = ''.obs;
  var totalAmount = ''.obs;
  var dateTime = ''.obs;
  var items = <Map<String, dynamic>>[].obs; // List of item maps

  final SupabaseClient supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['qrData'] != null) {
      parseQRData(Get.arguments['qrData']);
    } else {
      print("⚠️ No QR data received");
    }
  }

  // ✅ Parses scanned QR data
  void parseQRData(String qrData) async {
    print("📱 Scanned QR Data received:\n$qrData");

    List<String> lines = qrData.split("\n");
    String? lastItemName;
    String? lastItemPrice;

    for (var line in lines) {
      line = line.trim();

      if (line.startsWith("Cart Id:")) {
        cartId.value = line.split(":")[1].trim();
      } else if (line.startsWith("Total:")) {
        totalAmount.value = line.split(":")[1].replaceAll("Rs.", "").trim();
      } else if (line.startsWith("Date & Time:")) {
        String extractedDate = line.replaceFirst("Date & Time:", "").trim();

        try {
          // Convert "21-03-2025 12:28:31" → "2025-03-21 12:28:31"
          List<String> dateParts = extractedDate.split(" ");
          List<String> dmy = dateParts[0].split("-");
          String formattedDate = "${dmy[2]}-${dmy[1]}-${dmy[0]} ${dateParts[1]}";

          dateTime.value = formattedDate; // ✅ Correct format for Supabase
        } catch (e) {
          print("⚠️ Date formatting error: $e");
          dateTime.value = "Invalid Date";
        }
      } else if (line.contains(" - Rs.")) {
        List<String> parts = line.split(" - Rs.");
        lastItemName = parts[0].trim();
        lastItemPrice = parts[1].trim();
      } else if (line.startsWith("Quantity-") && lastItemName != null && lastItemPrice != null) {
        String quantity = line.split("-")[1].trim();
        items.add({
          "name": lastItemName,
          "price": lastItemPrice,
          "quantity": quantity,
        });

        lastItemName = null;
        lastItemPrice = null;
      }
    }

    if (cartId.isEmpty) cartId.value = "Unknown";
    if (totalAmount.isEmpty) totalAmount.value = "0.0";

    print("🛒 Extracted Cart ID: ${cartId.value}");
    print("💰 Total Amount: ${totalAmount.value}");
    print("📅 Date & Time: ${dateTime.value}");
    print("🛍 Items List:");
    for (var item in items) {
      print("   - ${item['name']} | Price: Rs. ${item['price']} | Quantity: ${item['quantity']}");
    }

    await insertIntoSupabase();
  }

  // ✅ Inserts scanned data into Supabase
  Future<void> insertIntoSupabase() async {
    try {
      await supabase.from('cart_details').insert({
        'order_id': cartId.value,
        'items': items,
        'total': double.tryParse(totalAmount.value) ?? 0.0,
        'datetime': dateTime.value, // ✅ Correctly formatted timestamp
      });

      print("✅ Data inserted into Supabase successfully.");
    } catch (e) {
      print("❌ Error inserting data into Supabase: $e");
    }
  }

  // ✅ Sends data to Payment History when Proceed to Pay is clicked
  void proceedToPay() {
    final paymentController = Get.find<PaymentController>();

    Map<String, dynamic> newPayment = {
      'cartId': cartId.value,
      'date': dateTime.value,
      'total': totalAmount.value,
      'items': items.map((item) => {
        'name': item['name'],
        'price': item['price'],
        'quantity': item['quantity']
      }).toList(),
    };

    paymentController.addPayment(newPayment);

    // Navigate to Payment Screen
    // Get.to(() => PaymentScreen(title: '',));
  }
}*/
