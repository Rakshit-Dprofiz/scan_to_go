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
