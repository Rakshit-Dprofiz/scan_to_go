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
}