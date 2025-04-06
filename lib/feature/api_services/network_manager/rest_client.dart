// import '../model/user_list_in_object.dart';
// import 'http_helper.dart';
//
// class RestClient {
//   static final HttpHelper _httpHelper = HttpHelper();
//
//   // static Future<PostApiModel> postApi (Object reqModel) async {
//   //   Map params = {
//   //     "email" : "eve.holt@reqres.in",
//   //     "password" : "pistol"
//   //   };
//   //   Map<String, dynamic > response = await httpHelper.post(url: 'https://reqres.in/api/register',requestBody: params);
//   //   return PostApiModel.fromJson(response);
//   // }
//
// // //--------------------------------------
//   static Future<CartListInObject> getCartListInObject() async {
//     Map<String, dynamic> response = await _httpHelper.get(
//         url:
//             'https://smapca.onrender.com/cart/3fce1c70-ee00-4799-872a-280cf89b3eb7');
//     return CartListInObject.fromJson(response);
//   }
// //   //--------------------------------------
//   // --------------------------------------
//
//
// }
//
// //--------------------------------------
//
//   // static Future<Map<String, dynamic>> getUserListInObject() async {
//   //   String url =
//   //       "https://smapca.onrender.com/cart/1079c0b2-f4b6-47b5-bed5-f5a56e21269c";
//
//   //   Map<String, dynamic> response = await _httpHelper.get(url: url);
//
//   //   return response;
//   //}
//



/*

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';

class RestClient {
  static Future<CartListInObject> getCartListInObject(String cartId) async {
    final String url = "https://smapca.onrender.com/cart/$cartId";

    try {
      print("Making API call to: $url");

      final response = await http.get(Uri.parse(url), headers: {
        "Content-type": "application/json",
      });

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return CartListInObject.fromJson(jsonData);
      } else {
        throw Exception("Failed to load cart data: ${response.body}");
      }
    } catch (error) {
      throw Exception("Error fetching cart: $error");
    }
  }
}
*/





import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scan_to_go/feature/api_services/model/user_list_in_object.dart';

class RestClient {

/*  static Future<CartListInObject> getCartListInObject(String trollyId) async {
    final String url = "https://smapca.onrender.com/cart/$trollyId"; // Updated URL

    try {
      print("Making API call to: $url");

      final response = await http.get(Uri.parse(url), headers: {
        "Content-type": "application/json",
      });

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return CartListInObject.fromJson(jsonData);
      } else {
        throw Exception("Failed to load cart data: ${response.body}");
      }
    } catch (error) {
      throw Exception("Error fetching cart: $error");
    }
  }*/

  // Updated method to send QR data to the backend
  static Future<void> sendQrData(String trollyId, String encrypted_string) async {
    final String url = "https://smapca.onrender.com/cart/scan"; // Updated API endpoint
    final Map<String, String> requestBody = {
      "trolly_id": trollyId, // Changed key from cart_id to trolly_id
      "encrypted_string": encrypted_string,
    };

    try {
      print("Sending QR Data to: $url");
      print("Request Body: ${json.encode(requestBody)}");

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-type": "application/json"},
        body: json.encode(requestBody),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode != 200) {
        throw Exception("Failed to send QR data: ${response.body}");
      }
    } catch (error) {
      throw Exception("Error sending QR data: $error");
    }
  }

  // Updated method to Payment id data to the backend
  static Future<void> sendPaymentData(String orderId, String paymentId) async {
    final String url = "https://smapca.onrender.com/api/payments/update-payment-status"; // Updated API endpoint
    final Map<String, String> requestBody = {
      "orderId": orderId,
      "paymentId": paymentId,
    };

    try {
      print("Sending Payment Data to: $url");
      print("Request Body: ${json.encode(requestBody)}");

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-type": "application/json"},
        body: json.encode(requestBody),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode != 200) {
        throw Exception("Failed to send QR data: ${response.body}");
      }
    } catch (error) {
      throw Exception("Error sending QR data: $error");
    }
  }
}
