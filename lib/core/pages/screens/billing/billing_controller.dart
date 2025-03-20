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




import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';
import '../../../../feature/api_services/network_manager/rest_client.dart';

class BillingController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;

  var cartId = ''.obs;
  var loading = false.obs;
  var qrData = ''.obs;
  var cartDetails = Rxn<CartListInObject>(); // Holds API response

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments['qrData'] != null) {
      qrData.value = Get.arguments['qrData'];
      print("📱 Encrypted QR Data received: ${qrData.value}");
    } else {
      print("⚠️ No QR data received");
    }

    fetchCartByEncryptedQR();
    super.onInit();
  }

  Future<void> fetchCartByEncryptedQR() async {
    if (qrData.value.isEmpty) {
      print("❌ No valid QR data available");
      return;
    }

    try {
      loading.value = true;
      print("🔄 Fetching cart using encrypted QR value...");

      final existingCart = await supabase
          .from('cart_details')
          .select('id')
          .eq('string', qrData.value)
          .limit(1);

      print("🔍 Supabase response: $existingCart");

      if (existingCart is List && existingCart.isNotEmpty && existingCart[0]['id'] != null) {
        cartId.value = existingCart[0]['id'];
        print("✅ Found cart with ID: ${cartId.value}");

        // Fetch cart details from API using cartId
        await fetchCartDetails();
      } else {
        print("❌ No cart found for string: ${qrData.value}");
      }
    } catch (error) {
      print("🚨 Error fetching cart: $error");
    } finally {
      loading.value = false;
    }
  }

  Future<void> fetchCartDetails() async {
    if (cartId.value.isEmpty) {
      print("⚠️ No cartId available, cannot fetch cart details.");
      return;
    }

    try {
      print("📡 Calling API to fetch cart details...");
      final cartData = await RestClient.getCartListInObject(cartId.value);
      cartDetails.value = cartData;
      print("✅ Cart details fetched successfully.");
    } catch (error) {
      print("🚨 Error fetching cart details: $error");
    }
  }
}
