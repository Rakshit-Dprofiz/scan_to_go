// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// import 'core/pages/services/login_screen.dart';
//
// void main() async {
//   // supabase
//   WidgetsFlutterBinding.ensureInitialized();
//   await Supabase.initialize(
//     url: "https://bsilrypayezezlaifylf.supabase.co",
//     anonKey:
//     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJzaWxyeXBheWV6ZXpsYWlmeWxmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA5OTk3NTQsImV4cCI6MjA1NjU3NTc1NH0.hwAGBLZouOVJ-x2il_Bg3xsIH2v9S8nxwKIhTcKD-9Q",
//   );
//
//   // run app
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen()); // Pass a valid AuthService instance
//   }
// }
//
//
//
//



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://bsilrypayezezlaifylf.supabase.co",
    anonKey:
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJzaWxyeXBheWV6ZXpsYWlmeWxmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA5OTk3NTQsImV4cCI6MjA1NjU3NTc1NH0.hwAGBLZouOVJ-x2il_Bg3xsIH2v9S8nxwKIhTcKD-9Q",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}

