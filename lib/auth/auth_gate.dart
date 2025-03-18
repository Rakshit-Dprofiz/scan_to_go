// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../core/pages/screens/profile.dart';
// import '../core/pages/services/login_screen.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<AuthState>(
//       stream: Supabase.instance.client.auth.onAuthStateChange,
//       builder: (context, snapshot) {
//         // final session = Supabase.instance.client.auth.currentSession;
//         final session = snapshot.data?.session;
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//
//         if (session != null && session.user != null) {
//           print("User Signed In: ${session.user?.email}");
//           return const Profile();
//         } else {
//           print("User Signed Out or Not Signed In");
//           return const LoginScreen();
//         }
//       },
//     );
//   }
// }

// --------------------------------------

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/pages/screens/billing/billing_screen.dart';
import '../core/pages/screens/home/home_screen.dart';
import '../core/pages/screens/payment_history/page/payment_history_screen.dart';
import '../core/pages/screens/payment_screen/payment_screen.dart';
import '../core/pages/screens/profile/profile.dart';
import '../core/pages/screens/profile/qr_scanner.dart';
import '../core/pages/services/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // listen to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      // build appropriate page based on auth state
      builder: (context, snapshot) {
        // loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // check if there is a valid session currently
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null ) {
          print("User Signed In: ${session.user?.email}");
          return const HomeScreen();
          // return  BillingScreen();
          // return  PaymentHistoryScreen();

        } else {
          // print("User Signed Out or Not Signed In");
          return const LoginScreen();
          // return  PaymentHistoryScreen();
          // return  BillingScreen();
        }
      },
    );
  }
}
