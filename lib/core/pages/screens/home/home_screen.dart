import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:scan_to_go/auth/auth_service.dart';
import '../../services/login_screen.dart';
import '../profile/profile_drawer.dart';
import '../profile/qr_scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final User? user = Supabase.instance.client.auth.currentUser;
    final String personalemail = user?.email ?? "No Email";
    // final String name = user?.userMetadata?['full_name'] ?? "No Name";
    final String name = user?.userMetadata?['name'] ?? "No Name";
    final String user_id = user?.id ?? "No UID"; // Fetching the UID

    void _logout() async {
      await _authService.signOut();
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Home Screen",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,color: Colors.black,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Confirm Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () async {
                          Navigator.of(context).pop(); // Close dialog
                          await _authService.signOut();
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          }
                        },
                        child: const Text("Logout", style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

      drawer: ProfileDrawer(name: name, email: personalemail),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcome, $name",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Email: $personalemail",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            // Text(
            //   "UID: $user_id", // Displaying the UID
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(
            //     fontSize: 16,
            //     color: Colors.black54,
            //   ),
            // ),
            // const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                debugPrint(
                    "🚀 Navigating to QRProcessingScreen with user_id: $user_id");
                Get.to(() => QRProcessingScreen(),
                    arguments: {"user_id": user_id});
              },
              child: const Text(
                "Scan From Here",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
