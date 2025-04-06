/*
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // ✅ Fetch the logged-in User UUID
  Future<String?> fetchUserUUID() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) throw Exception("User not logged in.");

      print("✅ User UUID: ${user.id}");
      return user.id;
    } catch (error) {
      print("❌ Error fetching User UUID: $error");
      return null;
    }
  }

  // ✅ Fetch Cart ID for the logged-in user
  Future<String?> fetchCartId() async {
    try {
      // Fetch the user's UUID
      String? userId = await fetchUserUUID();
      if (userId == null) throw Exception("User UUID not found.");

      // ✅ Check if cart_details has a column for user association (adjust column name)
      final response = await _supabase
          .from('cart') // Ensure this is the correct table name
          .select('id') // ✅ Fetch `id`, NOT `uuid`
          .eq('user_id', userId) // ✅ Ensure user_id exists in cart_details
          .maybeSingle(); // Allows empty response without throwing errors

      if (response == null) {
        print("❌ No cart ID found for user: $userId");
        return null;
      }

      String trolly_id = response['id'];
      print("✅ Cart ID: $trolly_id");
      return trolly_id;
    } catch (error) {
      print("❌ Error fetching cart ID: $error");
      return null;
    }
  }
}
*//*



import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // ✅ Fetch the logged-in User UUID
  Future<String?> fetchUserUUID() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) throw Exception("User not logged in.");

      print("✅ User UUID: ${user.id}");
      return user.id;
    } catch (error) {
      print("❌ Error fetching User UUID: $error");
      return null;
    }
  }

  // ✅ Fetch Trolly ID for the logged-in user (Updated for new table)
  Future<String?> fetchTrollyId() async {
    try {
      // Fetch the user's UUID
      String? userId = await fetchUserUUID();
      if (userId == null) throw Exception("User UUID not found.");

      // ✅ Check if cart_details has a column for user association (adjust column name)
      final response = await _supabase
          .from('cart') // Ensure this is the correct table name
          .select('trolly_id') // Fetch `trolly_id`, NOT `uuid`
          .eq('user_id', userId) // Ensure user_id exists in cart_details
          .maybeSingle(); // Allows empty response without throwing errors

      if (response == null) {
        print("❌ No trolly_id found for user: $userId");
        return null;
      }

      String trollyId = response['trolly_id'];
      print("✅ Trolly ID: $trollyId");
      return trollyId;
    } catch (error) {
      print("❌ Error fetching trolly ID: $error");
      return null;
    }
  }
}
*/


import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // ✅ Fetch the logged-in User UUID
  Future<String?> fetchUserUUID() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) throw Exception("User not logged in.");

      print("✅ User UUID: ${user.id}");
      return user.id;
    } catch (error) {
      print("❌ Error fetching User UUID: $error");
      return null;
    }
  }

  // ✅ Insert payment/cart data into Supabase
  Future<void> insertCartData({
    required String orderId,
    required List<Map<String, dynamic>> items,
    required double total,
    required String datetime,
  }) async {
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) throw Exception("User not logged in");

      await _supabase.from('cart').insert({
        'order_id': orderId,
        'items': items,
        'total': total,
        'datetime': datetime,
        'user_id': user.id,
      });

      print("🟢 Cart data inserted into Supabase ✅");
    } catch (e) {
      print("❌ Failed to insert cart data: $e");
    }
  }

  // ✅ Fetch billing data using both order_id and user_id
  Future<Map<String, dynamic>?> getBillingHistoryByUser(String orderId) async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) {
        print("❌ User not logged in.");
        return null;
      }

      print("🔍 Fetching billing history for User ID: $userId & Order ID: $orderId");

      final response = await _supabase
          .from('cart')
          .select()
          .eq('user_id', userId)
          .eq('order_id', orderId)
          .maybeSingle();

      if (response == null) {
        print("❌ No billing record found for order: $orderId");
        return null;
      }

      print("✅ Billing record found: $response");
      return Map<String, dynamic>.from(response);
    } catch (e) {
      print("❌ Error fetching billing history: $e");
      return null;
    }
  }

  // ✅ Fetch all billing history (Optional)
  Future<List<Map<String, dynamic>>> getAllBillingHistory() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) throw Exception("User not logged in.");

      final response = await _supabase
          .from('cart')
          .select()
          .eq('user_id', userId)
          .order('datetime', ascending: false);

      print("✅ Fetched all billing records: ${response.length}");
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print("❌ Error fetching all billing history: $e");
      return [];
    }
  }
}


