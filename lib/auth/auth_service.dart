import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in with Email & password
  Future<AuthResponse> signInWithEmailPassword(
      String email, String password) async {
    return await _supabase.auth
        .signInWithPassword(email: email, password: password);
  }

  // Sign up with Email & Password
  Future<AuthResponse> signUpWithEmailPassword(
      String email, String password) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  // Sign Out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // ✅ **Get Current User**
  User? getCurrentUser() {
    return _supabase.auth.currentUser;
  }

  // ✅ **Check if Email is Verified**
  Future<bool> isEmailVerified() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return false;

    // Refresh user session to get the latest data
    await _supabase.auth.refreshSession();

    // Get updated user data
    final updatedUser = _supabase.auth.currentUser;

    // Supabase uses `email_confirmed_at` timestamp to check email verification status
    return updatedUser?.emailConfirmedAt != null;
  }

  // ----------
  Future<AuthResponse> googleSignIn() async {
    const webClientId =
        '215085029356-6n4fh6r4fcs782i8l0htucih3mhlqmmn.apps.googleusercontent.com';
    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: webClientId,
      scopes: ['email'],
    );

    // Ensure previous sessions are cleared so user is asked to pick an account
    await googleSignIn.signOut();

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw 'Google Sign-In aborted by the user.';
    }

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;

    if (idToken == null) {
      throw 'Failed to retrieve ID Token from Google.';
    }

    return await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
