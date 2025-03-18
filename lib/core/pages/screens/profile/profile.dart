// // import 'package:flutter/material.dart';
// // import 'package:supabase_flutter/supabase_flutter.dart';
// // import 'package:scan_to_go/auth/auth_service.dart';
// //
// // import '../services/login_screen.dart';
// //
// // class Profile extends StatefulWidget {
// //   const Profile({super.key});
// //
// //   @override
// //   State<Profile> createState() => _ProfileState();
// // }
// //
// // class _ProfileState extends State<Profile> {
// //   final AuthService _authService = AuthService();
// //   final User? user = Supabase.instance.client.auth.currentUser;
// //
// //   // void _logout() async {
// //   //   await _authService.signOut();
// //   //   print("User Logged Out");
// //   // }
// //
// //   void _logout() async {
// //     await _authService.signOut();
// //     if (mounted) {
// //       Navigator.pushReplacement(context,
// //           MaterialPageRoute(builder: (context) => const LoginScreen()));
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final String email = user?.email ?? "No Email";
// //     final String name = user?.userMetadata?['full_name'] ?? "No Name";
// //     final String imageUrl = user?.userMetadata?['avatar_url'] ??
// //         "https://via.placeholder.com/150"; // Default image
// //
// //     return Scaffold(
// //       backgroundColor: Colors.green[50],
// //       appBar: AppBar(
// //         backgroundColor: Colors.green,
// //         title: const Text("Profile"),
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.logout),
// //             onPressed: _logout,
// //           ),
// //         ],
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             CircleAvatar(
// //               radius: 50,
// //               backgroundImage: NetworkImage(imageUrl),
// //             ),
// //             const SizedBox(height: 10),
// //             Text("Name: $name", style: TextStyle(fontSize: 18)),
// //             Text("Email: $email", style: TextStyle(fontSize: 16)),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
//
// // -----------------------------------------------------------------------------
//
// // -------------------------------------------------------------


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Name: ${user?.userMetadata?['full_name'] ?? 'No Name'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${user?.email ?? 'No Email'}',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await Supabase.instance.client.auth.signOut();
                  Get.offAllNamed('/login');
                },
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// -------------------------------- original ----------------------------------
// import 'package:flutter/material.dart';
// import 'package:scan_to_go/core/pages/screens/profile/profile_drawer.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:scan_to_go/auth/auth_service.dart';
// import '../../services/login_screen.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   final AuthService _authService = AuthService();
//
//   @override
//   Widget build(BuildContext context) {
//     final User? user = Supabase.instance.client.auth.currentUser;
//     final String email = user?.email ?? "No Email";
//     final String name = user?.userMetadata?['full_name'] ?? "No Name";
//
//     void _logout() async {
//       await _authService.signOut();
//       if (mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginScreen()),
//         );
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: const Text("Profile"),
//         centerTitle: true,
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () => Scaffold.of(context).openDrawer(),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: _logout,
//           ),
//         ],
//       ),
//       drawer: ProfileDrawer(name: name, email: email),
//       body: Center(
//         child: Text(
//           "Scan here",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

// -------------------------------- original ----------------------------------


 // -------------------------------------------------------------------------------
// // import 'dart:convert';
// // import 'dart:io';
// // import 'package:get/get.dart';
// // import 'package:flutter/material.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:trasheecustomer/screens/customer/navigation_menu.dart';
// // import 'package:lottie/lottie.dart'; // For animated GIF (Lottie Animation)
// //
// // class QRCode extends StatefulWidget {
// //   const QRCode({super.key});
// //
// //   @override
// //   _QRCodeState createState() => _QRCodeState();
// // }
// //
// // class _QRCodeState extends State<QRCode> with TickerProviderStateMixin {
// //   final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
// //   late QRViewController _controller;
// //   final String _result = "Scan QR code";
// //   dynamic code;
// //   bool isLoading = false;
// //   dynamic actualCode;
// //   int id = 0;
// //   String updateUrl = "https://syntaxium.in/DUSTBIN_API/update_users_points.php";
// //
// //   int _points = 0;
// //   late AnimationController _animationController;
// //   late Animation<double> _animation;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController = AnimationController(
// //       duration: const Duration(milliseconds: 500),
// //       vsync: this,
// //     )..addListener(() {
// //       setState(() {});
// //     });
// //     _animation = Tween<double>(begin: 0.0, end: 100.0).animate(CurvedAnimation(
// //       parent: _animationController,
// //       curve: Curves.easeOut,
// //     ));
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     _animationController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           Expanded(
// //             flex: 8,
// //             child: QRView(
// //               key: _qrKey,
// //               onQRViewCreated: _onQRViewCreated,
// //             ),
// //           ),
// //           Expanded(
// //             flex: 1,
// //             child: Center(
// //               child: Text(
// //                 _result,
// //                 style: const TextStyle(fontSize: 20),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   void _onQRViewCreated(QRViewController controller) {
// //     _controller = controller;
// //     controller.scannedDataStream.listen((scanData) {
// //       _showDetailsDialog(scanData.code.toString());
// //     });
// //   }
// //
// //   bool _isJson(String data) {
// //     try {
// //       code = json.decode(data);
// //       return true;
// //     } catch (_) {
// //       return false;
// //     }
// //   }
// //
// //   void _showDetailsDialog(String details) {
// //     bool isJson = _isJson(details);
// //
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return StatefulBuilder(
// //           builder: (BuildContext context, StateSetter setState) {
// //             return AlertDialog(
// //               content: Container(
// //                 width: 300,
// //                 height: 400, // Increased height for animated GIF and text
// //                 alignment: Alignment.center,
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     if (!isJson)
// //                       Column(
// //                         children: [
// //
// //                           // Display points in bold and animate them
// //                           AnimatedSwitcher(
// //                             duration: const Duration(milliseconds: 500),
// //                             child: Text(
// //                               'Points  $_points',
// //                               key: ValueKey<int>(_points),
// //                               style: TextStyle(
// //                                 fontSize: 24,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: Colors.green,
// //                               ),
// //                             ),
// //                           ),
// //
// //
// //                           const SizedBox(height: 16),
// //                           // Add animated GIF (for example, a coin animation or any highlight animation)
// //                           Lottie.asset('images/loti/Animation - 1734431915823.json', width: 150),
// //                           const SizedBox(height: 16),
// //                           const Text("Congratulations! You got a point"),
// //                         ],
// //                       ),
// //                     Column(
// //                       children: [
// //                         Text(details),
// //                         const SizedBox(height: 16),
// //                       ],
// //                     ),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         _controller.stopCamera();
// //                         _controller.pauseCamera();
// //                         _controller.dispose();
// //                         Future.delayed(const Duration(seconds: 2));
// //
// //                         // Trigger the point update API call when "Close" is pressed
// //                         _addPoint(details);
// //                         Get.offAll(() => const NavigationMenu());
// //                       },
// //                       child: const Text("Close"),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
// //
// //   bool _isValidJsonFormat(String data) {
// //     try {
// //       final RegExp pointsPattern = RegExp(
// //           r'^\{"code":"[a-zA-Z0-9]{5}-[a-zA-Z0-9]{6}-[a-zA-Z0-9]{8}"\}$');
// //       var jsonData = json.decode(data);
// //       if (jsonData is Map && jsonData.containsKey('code')) {
// //         String code = jsonData['code'];
// //         if (pointsPattern.hasMatch('{"code":"$code"}')) {
// //           actualCode = jsonData["code"];
// //           return true;
// //         }
// //       }
// //     } catch (_) {
// //       return false;
// //     }
// //     return false;
// //   }
// //
// //   Future<void> _addPoint(String details) async {
// //     setState(() {
// //       isLoading = true;
// //     });
// //     var sharedPref = await SharedPreferences.getInstance();
// //     id = sharedPref.getInt("id") ?? 0;
// //
// //     try {
// //       Map<String, String> headers = {
// //         'Content-Type': 'application/x-www-form-urlencoded',
// //         'Accept': 'application/json',
// //       };
// //
// //       Map<String, String> updateBody = {
// //         "user_id": id.toString(),
// //         "code": actualCode.toString().trim()
// //       };
// //
// //       var response = await http.post(
// //         Uri.parse(updateUrl),
// //         headers: headers,
// //         body: updateBody,
// //       );
// //       var result = await jsonDecode(response.body);
// //
// //       if (response.statusCode == 200 && result['error'] == false) {
// //         Fluttertoast.showToast(msg: result['message'].toString());
// //         sharedPref.setInt("points", result["points"]);
// //         setState(() {
// //           _points = result["points"];
// //           _animationController.forward(from: 0.0);
// //         });
// //         _controller.stopCamera();
// //         _controller.pauseCamera();
// //         _controller.dispose();
// //         Future.delayed(const Duration(seconds: 2));
// //         Get.offAll(() => const NavigationMenu());
// //       } else {
// //         Fluttertoast.showToast(msg: result['message'].toString());
// //       }
// //     } on SocketException catch (e) {
// //       showDialog(
// //         context: context,
// //         builder: (BuildContext context) {
// //           debugPrint("Error: $e");
// //           return AlertDialog(
// //             title: const Text('Error'),
// //             content: const Text(
// //                 'A network error occurred.\nMake sure that your internet is working.'),
// //             actions: [
// //               ElevatedButton(
// //                 onPressed: () {
// //                   _controller.stopCamera();
// //                   _controller.pauseCamera();
// //                   _controller.dispose();
// //                   Future.delayed(const Duration(seconds: 2));
// //                   Navigator.of(context).pop();
// //                 },
// //                 child: const Text('Close'),
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     } catch (error) {
// //       debugPrint('Error during user update in catch: $error');
// //     } finally {
// //       setState(() {
// //         isLoading = false;
// //         code = null;
// //         actualCode = null;
// //       });
// //     }
// //   }
// // }
//
//
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Supabase.initialize(
//   //   url: "https://bsilrypayezezlaifylf.supabase.co",
//   //   anonKey:
//   //   "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJzaWxyeXBheWV6ZXpsYWlmeWxmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA5OTk3NTQsImV4cCI6MjA1NjU3NTc1NH0.hwAGBLZouOVJ-x2il_Bg3xsIH2v9S8nxwKIhTcKD-9Q",
//   // );
//
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
//       home: const QRCode(),
//     );
//   }
// }
//
// class QRCode extends StatefulWidget {
//   const QRCode({super.key});
//
//   @override
//   _QRCodeState createState() => _QRCodeState();
// }
//
// class _QRCodeState extends State<QRCode> with TickerProviderStateMixin {
//   final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
//   late QRViewController _controller;
//   bool isLoading = false;
//   dynamic actualCode;
//   int id = 0;
//   String updateUrlOL =
//       "https://syntaxium.in/DUSTBIN_API/update_users_points_live.php";
//   String updateUrlOF =
//       "https://syntaxium.in/DUSTBIN_API/update_users_points_offline.php";
//   int _points = 0;
//   late AnimationController _animationController;
//   int userId = 0;
//   int points = 0;
//   late SharedPreferences sharedPref;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSharedPrefs();
//
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     )..addListener(() {
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   // ✅ Load SharedPreferences values
//   Future<void> _loadSharedPrefs() async {
//     sharedPref = await SharedPreferences.getInstance();
//     setState(() {
//       userId = sharedPref.getInt("id") ?? 0;
//       points = sharedPref.getInt("points") ?? 0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 8,
//             child: QRView(
//               key: _qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Text(
//                 "Scan QR code",
//                 style: const TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) async {
//     // Initialize the controller
//     _controller = controller;
//     debugPrint("QRViewController created and initialized");
//
//     // Listen to scanned data stream
//     controller.scannedDataStream.listen((scanData) async {
//       debugPrint("Scanned QR code data: ${scanData.code}");
//
//       if (scanData.code != null) {
//         String qrData = scanData.code.toString();
//         debugPrint("QR Code Data: $qrData");
//         actualCode = qrData;
//
//         int points = extractPointsFromQRCode(qrData);
//         debugPrint("Extracted points: $points");
//
//         // Extract the first two characters
//         if (qrData.length >= 2) {
//           String firstTwoChars = qrData.substring(0, 2);
//           debugPrint("First Two Characters: $firstTwoChars");
//
//           // Define `details` properly
//           String details = "QR Code Details: $qrData"; // Example value
//
//           if (firstTwoChars == "OF") {
//             debugPrint("✅ QR Code starts with 'OF'");
//             //await _addPointOffline(details);
//             _showDetailsDialogOF(qrData);
//           } else if (firstTwoChars == "OL") {
//             debugPrint("✅ QR Code starts with 'OL'");
//             //await _addPointOnline(details);
//             _showDetailsDialogOL(qrData);
//           } else {
//             debugPrint("❌ QR Code does not start with 'OF' or 'OL'");
//           }
//         } else {
//           debugPrint(
//               "⚠️ QR Code data is too short to extract first two characters.");
//         }
//
//         // Parse the points from the QR code
//         // int points = extractPointsFromQRCode(qrData);
//         // debugPrint("Extracted points: $points");
//
//         // Show the details dialog with the scanned QR code and points info
//         //_showDetailsDialog(qrData);
//       }
//     });
//   }
//
//   // Helper function to extract points from the QR code
//   int extractPointsFromQRCode(String qrCode) {
//     // Updated regex pattern
//     RegExp regExp = RegExp(
//       r"^(OF|OL)(\d{6})([A-Za-z0-9]{3})([A-Z]{1})(\d{2})(\d{13,14})$",
//     );
//
//     // Match the pattern against the qrCode string
//     final match = regExp.firstMatch(qrCode);
//
//     if (match != null) {
//       // Extract values from the matched groups
//       String prefix = match.group(1)!; // "OF" or "OL"
//       String pincode = match.group(2)!;
//       String dustbinId = match.group(3)!;
//       String dustbinType = match.group(4)!;
//       int points = int.tryParse(match.group(5)!) ?? 0;
//       String rawTimestamp = match.group(6)!;
//
//       // Log extracted values
//       debugPrint("Prefix: $prefix");
//       debugPrint("Pincode: $pincode");
//       debugPrint("Dustbin ID: $dustbinId");
//       debugPrint("Dustbin Type: $dustbinType");
//       debugPrint("Points: $points");
//       debugPrint("Raw Timestamp: $rawTimestamp");
//
//       _points = points;
//
//       // Validate points range (1-30)
//       if (points < 1 || points > 30) {
//         debugPrint("Points must be between 1 and 30");
//         return 0; // Return 0 if points are out of valid range
//       }
//
//       // Convert raw timestamp to a usable format
//       String parsedTimestamp = formatTimestamp(rawTimestamp);
//       debugPrint("Formatted Timestamp: $parsedTimestamp");
//
//       // Return points
//       return points;
//     } else {
//       debugPrint("Invalid QR code format");
//       return 0; // Return 0 if the QR code doesn't match the expected format
//     }
//   }
//
//   // Function to format raw timestamp into a readable format
//   String formatTimestamp(String rawTimestamp) {
//     try {
//       if (rawTimestamp.length >= 14) {
//         String hour = rawTimestamp.substring(0, 2);
//         String minute = rawTimestamp.substring(2, 4);
//         String second = rawTimestamp.substring(4, 6);
//         String day = rawTimestamp.substring(6, 8);
//         String month = rawTimestamp.substring(8, 10);
//         String year = rawTimestamp.substring(10, 14);
//
//         return "$hour:$minute:$second $day-$month-$year"; // Format like "HH:MM:SS DD-MM-YYYY"
//       } else {
//         debugPrint("Timestamp length is too short: $rawTimestamp");
//         return "Invalid timestamp";
//       }
//     } catch (e) {
//       debugPrint("Error formatting timestamp: $e");
//       return "Error formatting timestamp";
//     }
//   }
//
//   // Displaying dialog with points and QR code details
//   // void _showDetailsDialog(String details) {
//   //   bool isJson = _isJson(details);
//   //
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return StatefulBuilder(
//   //         builder: (BuildContext context, StateSetter setState) {
//   //           return AlertDialog(
//   //             content: Container(
//   //               width: 300,
//   //               height: 400, // Increased height for animated GIF and text
//   //               alignment: Alignment.center,
//   //               child: Column(
//   //                 mainAxisSize: MainAxisSize.min,
//   //                 children: [
//   //                   if (!isJson)
//   //                     Column(
//   //                       children: [
//   //                         // Display points in bold and animate them
//   //                         AnimatedSwitcher(
//   //                           duration: const Duration(milliseconds: 500),
//   //                           child: Text(
//   //                             'Points  $_points',
//   //                             key: ValueKey<int>(_points),
//   //                             style: TextStyle(
//   //                               fontSize: 24,
//   //                               fontWeight: FontWeight.bold,
//   //                               color: Colors.green,
//   //                             ),
//   //                           ),
//   //                         ),
//   //                         const SizedBox(height: 16),
//   //                         // Add animated GIF (for example, a coin animation or any highlight animation)
//   //                         Lottie.asset('images/loti/Animation - 1734431915823.json', width: 150),
//   //                         const SizedBox(height: 16),
//   //                         const Text("Congratulations! You got a point"),
//   //                       ],
//   //                     ),
//   //                   Column(
//   //                     children: [
//   //                       Text(details),
//   //                       const SizedBox(height: 16),
//   //                     ],
//   //                   ),
//   //                   ElevatedButton(
//   //                     onPressed: () {
//   //                       _controller.stopCamera();
//   //                       _controller.pauseCamera();
//   //                       _controller.dispose();
//   //                       Future.delayed(const Duration(seconds: 2));
//   //
//   //                       // Trigger the point update API call when "Close" is pressed
//   //                       _addPoint(details);
//   //
//   //                       // Navigate to the next screen after the "Close" button is pressed
//   //                       Get.offAll(() => const NavigationMenu());
//   //                     },
//   //                     child: const Text("Close"),
//   //                   ),
//   //                 ],
//   //               ),
//   //             ),
//   //           );
//   //         },
//   //       );
//   //     },
//   //   );
//   // }
//
//   void _showDetailsDialogOF(String details) {
//     bool isJson = _isJson(details);
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return AlertDialog(
//               content: Container(
//                 width: 300,
//                 height: 400, // Increased height for animated GIF and text
//                 alignment: Alignment.center,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     if (!isJson)
//                       Column(
//                         children: [
//                           // Display points in bold and animate them
//                           AnimatedSwitcher(
//                             duration: const Duration(milliseconds: 500),
//                             child: Text(
//                               'Points  $_points',
//                               key: ValueKey<int>(_points),
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color:
//                                 Colors.green, // Highlight points in green
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           // Add animated GIF (for example, a coin animation or any highlight animation)
//                           // Lottie.asset(
//                           //     'images/loti/Animation - 1734431915823.json',
//                           //     width: 150),
//                           const SizedBox(height: 16),
//                           const Text("Congratulations! You got a point"),
//                         ],
//                       ),
//                     Column(
//                       children: [
//                         // Text(details),
//                         const SizedBox(height: 16),
//                       ],
//                     ),
//
//                     // ElevatedButton(
//                     //   // onPressed: () {
//                     //   //   _controller.stopCamera();
//                     //   //   _controller.pauseCamera();
//                     //   //   _controller.dispose();
//                     //   //   Future.delayed(const Duration(seconds: 2));
//                     //   //
//                     //   //   // Trigger the point update API call when "Close" is pressed
//                     //   //   _addPoint(details);
//                     //   //
//                     //   //   // Navigate to the next screen after the "Close" button is pressed
//                     //   //   Get.offAll(() => const NavigationMenu());
//                     //   // },
//                     //   onPressed: () async {
//                     //     // Prevent multiple button clicks by disabling the button while the API is being called
//                     //     setState(() {
//                     //       isLoading = true; // This will trigger UI changes like showing a progress indicator
//                     //     });
//                     //
//                     //     // Stop and dispose the camera before performing any API call
//                     //     _controller.stopCamera();
//                     //     _controller.pauseCamera();
//                     //     _controller.dispose();
//                     //
//                     //     try {
//                     //       // Call the API to add points and wait for the result
//                     //       await _addPoint(details);
//                     //
//                     //       // Once the API call is finished, navigate to the NavigationMenu screen
//                     //       if (!isLoading) {
//                     //         Get.offAll(() => const NavigationMenu());
//                     //       }
//                     //     } catch (error) {
//                     //       // Handle any errors that occur during the API call
//                     //       debugPrint("Error during API call: $error");
//                     //     } finally {
//                     //       // After the API call (whether successful or failed), allow the user to interact again
//                     //       setState(() {
//                     //         isLoading = false;  // Re-enable the UI (hide progress indicator)
//                     //       });
//                     //     }
//                     //   },
//                     //
//                     //
//                     //   child: const Text("Close"),
//                     // ),
//                     ElevatedButton(
//                       onPressed: isLoading
//                           ? null // Disable the button when loading is true
//                           : () async {
//                         // Prevent multiple button clicks by disabling the button while the API is being called
//                         setState(() {
//                           isLoading =
//                           true; // This will trigger UI changes like showing a progress indicator
//                         });
//
//                         // Stop and dispose the camera before performing any API call
//                         _controller.stopCamera();
//                         _controller.pauseCamera();
//                         _controller.dispose();
//
//                         try {
//                           // Call the API to add points and wait for the result
//                           // await _addPointOffline(details);
//                           // await _addPointOnline(details);
//
//                           await _addPointOffline(details);
//                           await _loadSharedPrefs();
//
//                           // Once the API call is finished, navigate to the NavigationMenu screen
//                           if (!isLoading) {
//                             // Get.offAll(() => const NavigationMenu());
//
//                             // ✅ Ensure NavigationController is initialized before calling refresh
//                             // Future.delayed(Duration(milliseconds: 300), () {
//                             //   if (Get.isRegistered<NavigationController>()) {
//                             //     Get.find<NavigationController>().refreshUI();
//                             //   }
//                             // });
//                           }
//                         } catch (error) {
//                           // Handle any errors that occur during the API call
//                           debugPrint("Error during API call: $error");
//                         } finally {
//                           // After the API call (whether successful or failed), allow the user to interact again
//                           setState(() {
//                             isLoading =
//                             false; // Re-enable the UI (hide progress indicator)
//                           });
//                         }
//                       },
//                       child: isLoading
//                           ? const CircularProgressIndicator() // Show progress indicator when loading is true
//                           : const Text("Close"), // Show text when not loading
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   void _showDetailsDialogOL(String details) {
//     bool isJson = _isJson(details);
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return AlertDialog(
//               content: Container(
//                 width: 300,
//                 height: 400, // Increased height for animated GIF and text
//                 alignment: Alignment.center,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     if (!isJson)
//                       Column(
//                         children: [
//                           // Display points in bold and animate them
//                           AnimatedSwitcher(
//                             duration: const Duration(milliseconds: 500),
//                             child: Text(
//                               'Points  $_points',
//                               key: ValueKey<int>(_points),
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color:
//                                 Colors.green, // Highlight points in green
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           // Add animated GIF (for example, a coin animation or any highlight animation)
//                           // Lottie.asset(
//                           //     'images/loti/Animation - 1734431915823.json',
//                           //     width: 150),
//                           const SizedBox(height: 16),
//                           const Text("Congratulations! You got a point"),
//                         ],
//                       ),
//                     Column(
//                       children: [
//                         Text(details),
//                         const SizedBox(height: 16),
//                       ],
//                     ),
//                     // ElevatedButton(
//                     //   // onPressed: () {
//                     //   //   _controller.stopCamera();
//                     //   //   _controller.pauseCamera();
//                     //   //   _controller.dispose();
//                     //   //   Future.delayed(const Duration(seconds: 2));
//                     //   //
//                     //   //   // Trigger the point update API call when "Close" is pressed
//                     //   //   _addPoint(details);
//                     //   //
//                     //   //   // Navigate to the next screen after the "Close" button is pressed
//                     //   //   Get.offAll(() => const NavigationMenu());
//                     //   // },
//                     //   onPressed: () async {
//                     //     // Prevent multiple button clicks by disabling the button while the API is being called
//                     //     setState(() {
//                     //       isLoading = true; // This will trigger UI changes like showing a progress indicator
//                     //     });
//                     //
//                     //     // Stop and dispose the camera before performing any API call
//                     //     _controller.stopCamera();
//                     //     _controller.pauseCamera();
//                     //     _controller.dispose();
//                     //
//                     //     try {
//                     //       // Call the API to add points and wait for the result
//                     //       await _addPoint(details);
//                     //
//                     //       // Once the API call is finished, navigate to the NavigationMenu screen
//                     //       if (!isLoading) {
//                     //         Get.offAll(() => const NavigationMenu());
//                     //       }
//                     //     } catch (error) {
//                     //       // Handle any errors that occur during the API call
//                     //       debugPrint("Error during API call: $error");
//                     //     } finally {
//                     //       // After the API call (whether successful or failed), allow the user to interact again
//                     //       setState(() {
//                     //         isLoading = false;  // Re-enable the UI (hide progress indicator)
//                     //       });
//                     //     }
//                     //   },
//                     //
//                     //
//                     //   child: const Text("Close"),
//                     // ),
//                     ElevatedButton(
//                       onPressed: isLoading
//                           ? null // Disable the button when loading is true
//                           : () async {
//                         // Prevent multiple button clicks by disabling the button while the API is being called
//                         setState(() {
//                           isLoading =
//                           true; // This will trigger UI changes like showing a progress indicator
//                         });
//
//                         // Stop and dispose the camera before performing any API call
//                         _controller.stopCamera();
//                         _controller.pauseCamera();
//                         _controller.dispose();
//
//                         try {
//                           // Call the API to add points and wait for the result
//                           // await _addPointOffline(details);
//                           // await _addPointOnline(details);
//                           await _addPointOnline(details);
//
//                           // Once the API call is finished, navigate to the NavigationMenu screen
//                           if (!isLoading) {
//                             // Get.offAll(() => const NavigationMenu());
//                           }
//                         } catch (error) {
//                           // Handle any errors that occur during the API call
//                           debugPrint("Error during API call: $error");
//                         } finally {
//                           // After the API call (whether successful or failed), allow the user to interact again
//                           setState(() {
//                             isLoading =
//                             false; // Re-enable the UI (hide progress indicator)
//                           });
//                         }
//                       },
//                       child: isLoading
//                           ? const CircularProgressIndicator() // Show progress indicator when loading is true
//                           : const Text("Close"), // Show text when not loading
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   // Function to check if the QR data is JSON
//   bool _isJson(String data) {
//     try {
//       json.decode(data);
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   // Function to send the updated points to the server
//   Future<void> _addPointOffline(String details) async {
//     setState(() {
//       isLoading = true;
//     });
//
//     var sharedPref = await SharedPreferences.getInstance();
//     id = sharedPref.getInt("id") ?? 0;
//     debugPrint("User ID: $id");
//
//     try {
//       Map<String, String> headers = {
//         'Content-Type': 'application/x-www-form-urlencoded',
//         'Accept': 'application/json',
//       };
//
//       // Log the request body
//       debugPrint(
//           "Request Body: user_id=$id, code=${actualCode.toString().trim()}");
//
//       Map<String, String> updateBody = {
//         "user_id": id.toString(),
//         "code": actualCode.toString().trim(),
//       };
//
//       debugPrint("Sending POST request to: $updateUrlOF");
//
//       var response = await http.post(
//         Uri.parse(updateUrlOF),
//         headers: headers,
//         body: updateBody,
//       );
//
//       debugPrint("Response status: ${response.statusCode}");
//       debugPrint("Response body: ${response.body}");
//
//       var result = await jsonDecode(response.body);
//
//       if (response.statusCode == 200 && result['error'] == false) {
//         debugPrint("Success response: ${result['message']}");
//         Fluttertoast.showToast(msg: result['message'].toString());
//         sharedPref.setInt("points", result["points"]);
//         setState(() {
//           _points = result["points"];
//           _animationController.forward(from: 0.0);
//         });
//       } else {
//         debugPrint("Error response: ${result['message']}");
//         Fluttertoast.showToast(msg: result['message'].toString());
//       }
//     } on SocketException catch (e) {
//       debugPrint("SocketException: $e");
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Error'),
//             content: const Text(
//                 'A network error occurred.\nMake sure that your internet is working.'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   _controller.stopCamera();
//                   _controller.pauseCamera();
//                   _controller.dispose();
//                   Future.delayed(const Duration(seconds: 2));
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('Close'),
//               ),
//             ],
//           );
//         },
//       );
//     } catch (error) {
//       debugPrint('Error during user update: $error');
//     } finally {
//       debugPrint("Update process finished. Resetting loading state.");
//       setState(() {
//         isLoading = false;
//         actualCode = null;
//       });
//     }
//   }
//
//   Future<void> _addPointOnline(String details) async {
//     setState(() {
//       isLoading = true;
//     });
//
//     var sharedPref = await SharedPreferences.getInstance();
//     id = sharedPref.getInt("id") ?? 0;
//     debugPrint("User ID: $id");
//
//     try {
//       Map<String, String> headers = {
//         'Content-Type': 'application/x-www-form-urlencoded',
//         'Accept': 'application/json',
//       };
//
//       // Log the request body
//       debugPrint(
//           "Request Body: user_id=$id, code=${actualCode.toString().trim()}");
//
//       Map<String, String> updateBody = {
//         "user_id": id.toString(),
//         "code": actualCode.toString().trim(),
//       };
//
//       debugPrint("Sending POST request to: $updateUrlOL");
//
//       var response = await http.post(
//         Uri.parse(updateUrlOL),
//         headers: headers,
//         body: updateBody,
//       );
//
//       debugPrint("Response status: ${response.statusCode}");
//       debugPrint("Response body: ${response.body}");
//
//       var result = await jsonDecode(response.body);
//
//       if (response.statusCode == 200 && result['error'] == false) {
//         debugPrint("Success response: ${result['message']}");
//         Fluttertoast.showToast(msg: result['message'].toString());
//         sharedPref.setInt("points", result["points"]);
//         setState(() {
//           _points = result["points"];
//           _animationController.forward(from: 0.0);
//         });
//       } else {
//         debugPrint("Error response: ${result['message']}");
//         Fluttertoast.showToast(msg: result['message'].toString());
//       }
//     } on SocketException catch (e) {
//       debugPrint("SocketException: $e");
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Error'),
//             content: const Text(
//                 'A network error occurred.\nMake sure that your internet is working.'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   _controller.stopCamera();
//                   _controller.pauseCamera();
//                   _controller.dispose();
//                   Future.delayed(const Duration(seconds: 2));
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('Close'),
//               ),
//             ],
//           );
//         },
//       );
//     } catch (error) {
//       debugPrint('Error during user update: $error');
//     } finally {
//       debugPrint("Update process finished. Resetting loading state.");
//       setState(() {
//         isLoading = false;
//         actualCode = null;
//       });
//     }
//   }
// }

// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
//
// class QRProcessingScreen extends StatefulWidget {
//   @override
//   _QRProcessingScreenState createState() => _QRProcessingScreenState();
// }
//
// class _QRProcessingScreenState extends State<QRProcessingScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool isLoading = false;
//   int _points = 0;
//   int? id;
//   String? actualCode;
//   final String updateUrlOF = "YOUR_OFFLINE_API_URL";
//   final String updateUrlOL = "YOUR_ONLINE_API_URL";
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   void _onQRViewCreated(QRViewController qrController) {
//     controller = qrController;
//     controller?.scannedDataStream.listen((scanData) {
//       if (!isLoading) {
//         setState(() {
//           actualCode = scanData.code;
//           isLoading = true;
//         });
//         debugPrint("Scanned QR Code: $actualCode");
//         _showDetailsDialog(actualCode!, true); // Assuming online mode
//       }
//     });
//   }
//
//   void _showDetailsDialog(String details, bool isOnline) {
//     bool isJson = _isJson(details);
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               content: SizedBox(
//                 width: 300,
//                 height: 400,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     if (!isJson) _buildAnimatedPoints(),
//                     Text(details),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: isLoading
//                           ? null
//                           : () => _handlePointUpdate(setState, details, isOnline),
//                       child: isLoading
//                           ? const CircularProgressIndicator()
//                           : const Text("Close"),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildAnimatedPoints() {
//     return Column(
//       children: [
//         AnimatedSwitcher(
//           duration: const Duration(milliseconds: 500),
//           child: Text(
//             'Points $_points',
//             key: ValueKey<int>(_points),
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         // const Text("Congratulations! You got a point"),
//       ],
//     );
//   }
//
//   Future<void> _handlePointUpdate(
//       StateSetter setState, String details, bool isOnline) async {
//     setState(() => isLoading = true);
//
//     try {
//       await (isOnline ? _addPointOnline(details) : _addPointOffline(details));
//     } catch (error) {
//       debugPrint("Error updating points: $error");
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }
//
//   bool _isJson(String data) {
//     try {
//       json.decode(data);
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   Future<void> _addPointOffline(String details) async {
//     await _updatePoints(updateUrlOF);
//   }
//
//   Future<void> _addPointOnline(String details) async {
//     await _updatePoints(updateUrlOL);
//   }
//
//   Future<void> _updatePoints(String url) async {
//     var sharedPref = await SharedPreferences.getInstance();
//     id = sharedPref.getInt("id") ?? 0;
//     debugPrint("User ID: $id");
//
//     try {
//       Map<String, String> headers = {
//         'Content-Type': 'application/x-www-form-urlencoded',
//         'Accept': 'application/json',
//       };
//
//       Map<String, String> updateBody = {
//         "user_id": id.toString(),
//         "code": actualCode?.trim() ?? "",
//       };
//
//       debugPrint("Sending POST request to: $url with body: $updateBody");
//       var response =
//       await http.post(Uri.parse(url), headers: headers, body: updateBody);
//       debugPrint(
//           "Response status: ${response.statusCode}, body: ${response.body}");
//
//       var result = jsonDecode(response.body);
//       if (response.statusCode == 200 && result['error'] == false) {
//         debugPrint("Success: ${result['message']}");
//         Fluttertoast.showToast(msg: result['message']);
//         sharedPref.setInt("points", result["points"]);
//         setState(() => _points = result["points"]);
//       } else {
//         debugPrint("Error: ${result['message']}");
//         Fluttertoast.showToast(msg: result['message']);
//       }
//     } on SocketException catch (e) {
//       debugPrint("Network error: $e");
//       _showNetworkErrorDialog();
//     } catch (error) {
//       debugPrint("Exception: $error");
//     }
//   }
//
//   void _showNetworkErrorDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Error'),
//           content:
//           const Text('Network error occurred. Check your internet connection.'),
//           actions: [
//             ElevatedButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('QR Scanner')),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Text(
//                 actualCode ?? 'Scan a QR code',
//                 style: const TextStyle(fontSize: 18),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//------------------------------------------------------------------------------

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
//
// import '../payment_screen/payment_screen.dart';
//
// class QRProcessingScreen extends StatefulWidget {
//   const QRProcessingScreen({super.key});
//
//   @override
//   _QRProcessingScreenState createState() => _QRProcessingScreenState();
// }
//
// class _QRProcessingScreenState extends State<QRProcessingScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool isLoading = false;
//   int _points = 0;
//   int? id;
//   String? actualCode;
//   final String updateUrlOF = "YOUR_OFFLINE_API_URL";
//   final String updateUrlOL = "YOUR_ONLINE_API_URL";
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   void _onQRViewCreated(QRViewController qrController) {
//     controller = qrController;
//     controller?.scannedDataStream.listen((scanData) {
//       if (!isLoading) {
//         setState(() {
//           actualCode = scanData.code;
//           isLoading = true;
//         });
//         debugPrint("Scanned QR Code: $actualCode");
//         _showDetailsDialog(actualCode!, true);
//       }
//     });
//   }
//
//   void _showDetailsDialog(String details, bool isOnline) {
//     bool isJson = _isJson(details);
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               content: SizedBox(
//                 width: 300,
//                 height: 400,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     if (!isJson) _buildAnimatedPoints(),
//                     Text(details),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () {
//                         Get.back(); // Close the dialog
//                         Get.offAll(() => const PaymentScreen()); // Navigate and remove QR screen from stack
//                       },
//                       child: const Text("OK"),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildAnimatedPoints() {
//     return Column(
//       children: [
//         AnimatedSwitcher(
//           duration: const Duration(milliseconds: 500),
//           child: Text(
//             'Points $_points',
//             key: ValueKey<int>(_points),
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         const Text("Congratulations! You got a point"),
//       ],
//     );
//   }
//
//   void _navigateToPaymentScreen() {
//     Navigator.of(context).pop(); // Close the dialog
//     Get.to(() => PaymentScreen());
//   }
//
//   bool _isJson(String data) {
//     try {
//       json.decode(data);
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('QR Scanner')),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Text(
//                 actualCode ?? 'Scan a QR code',
//                 style: const TextStyle(fontSize: 18),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
