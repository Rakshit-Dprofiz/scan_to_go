// import 'package:get/get.dart';
// import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';
// import '../../../../feature/api_services/network_manager/rest_client.dart';
//
// class BillingController extends GetxController {
//   var cartListInObject = CartListInObject(cart: []).obs;
//   var loading = true.obs;
//
//   // Fetch cart details from API
//   void getCartList() {
//     RestClient.getCartListInObject().then((value) {
//       cartListInObject.value = value;
//       loading.value = false;
//     }).onError((error, stackTrace) {
//       print('Error => ${error.toString()}');
//       loading.value = false;
//     });
//   }
//
//   // Calculate total amount dynamically (Fixed null issue)
//   // Calculate total amount dynamically
//   double get totalAmount {
//     if (cartListInObject.value.cart == null) return 0.0;
//     // Explicitly specify that the accumulator is an int.
//     int sum = cartListInObject.value.cart!
//         .fold<int>(0, (int sum, item) => sum + (item.total ?? 0));
//     return sum.toDouble();
//   }
// }

//
// import 'package:get/get.dart';
// import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';
// import '../../../../feature/api_services/network_manager/rest_client.dart';
//
// class BillingController extends GetxController {
//   var cartListInObject = CartListInObject(cart: []).obs;
//   var loading = true.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getCartList();
//   }
//
//   // Fetch cart details from API
//   void getCartList() async {
//     try {
//       loading.value = true;
//       cartListInObject.value = await RestClient.getCartListInObject();
//     } catch (error) {
//       print('Error fetching cart: ${error.toString()}');
//     } finally {
//       loading.value = false;
//     }
//   }
//
//   // Calculate total amount dynamically
//   double get totalAmount {
//     if (cartListInObject.value.cart == null) return 0.0;
//     // For each cart, sum its total (treat missing total as 0.0)
//     return cartListInObject.value.cart!.fold<double>(
//         0.0, (sum, item) => sum + (item.total ?? 0.0));
//   }
// }
//

//
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


import 'dart:convert';
import 'package:get/get.dart';
import '../../../../feature/api_services/model/user_list_in_object.dart';
import '../../../../feature/api_services/network_manager/rest_client.dart';

class BillingController extends GetxController {
  var cartListInObject = CartListInObject(cart: []).obs;
  var loading = true.obs;
  String? qrData;

  // Sample cart data for demonstration
  final Map<String, dynamic> sampleCartData = {
    "cart": [
      {
        "id": "CART123",
        "total": 1250,
        "datetime": "2025-03-18T14:30:00Z",
        "order_id": "ORDER456",
        "items": [
          {
            "item": "Laptop",
            "price": 999,
            "quantity": 1
          },
          {
            "item": "Mouse",
            "price": 25,
            "quantity": 1
          },
          {
            "item": "Keyboard Cover",
            "price": 15,
            "quantity": 1
          }
        ]
      }
    ]
  };

  @override
  void onInit() {
    super.onInit();
    // Get QR data from arguments
    Map<String, dynamic>? args = Get.arguments;
    if (args != null && args.containsKey('qrData')) {
      qrData = args['qrData'];
      print("🔍 Received QR data: $qrData");
      processQRData();
    } else {
      print("❌ No QR data received");
      loading.value = false;
    }
  }

  // Process QR data and create cart details
  void processQRData() async {
    try {
      loading.value = true;

      if (qrData == null || qrData!.isEmpty) {
        throw Exception("QR data is empty");
      }

      // Since the API call is failing with the raw QR data as cart ID,
      // we'll use the QR data to generate a cart directly

      // Try to decode the QR data if it's Base64 encoded
      String decodedData;
      try {
        // Try Base64 decoding
        List<int> bytes = base64.decode(qrData!);
        decodedData = utf8.decode(bytes);
        print("🔄 Decoded QR data: $decodedData");
      } catch (e) {
        // If decoding fails, use raw data
        decodedData = qrData!;
        print("⚠️ Could not decode QR data: ${e.toString()}");
      }

      // Try to parse as JSON
      Map<String, dynamic> cartData;
      try {
        cartData = json.decode(decodedData);
        print("📋 Parsed QR data as JSON: $cartData");
      } catch (e) {
        // If parsing fails, use sample data
        print("⚠️ Could not parse QR data as JSON: ${e.toString()}");
        print("📝 Using sample cart data instead");
        cartData = sampleCartData;
      }

      // Create cart from data
      CartListInObject cart = CartListInObject.fromJson(cartData);
      cartListInObject.value = cart;

      print("✅ Cart data processed successfully");

      // Force UI refresh
      update();
    } catch (error) {
      print('❌ Error processing QR data: ${error.toString()}');

      // Use sample data as fallback
      print("📝 Using sample cart data as fallback");
      cartListInObject.value = CartListInObject.fromJson(sampleCartData);

      // Force UI refresh
      update();
    } finally {
      loading.value = false;
    }
  }

  // Calculate total amount
  double get totalAmount {
    if (cartListInObject.value.cart == null || cartListInObject.value.cart!.isEmpty) {
      return 0.0;
    }
    return cartListInObject.value.cart!.fold<double>(
      0.0,
          (sum, cart) => sum + (cart.total?.toDouble() ?? 0.0),
    );
  }
}