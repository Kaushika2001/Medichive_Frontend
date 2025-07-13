// import 'package:flutter/material.dart';
// import 'laboratory_login_page.dart';
// import 'lab_details_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Medichive Login',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: const Color(0xFFEFF6F9),
//       ),
//       home:
//           const LoginScreen(), // Change this to LaboratoryScreen() if you want it to open lab page first
//     );
//   }
// }

//2 interfaces seperately//

// import 'package:flutter/material.dart';
// import 'laboratory_login_page.dart'; // Contains LoginScreen
// import 'lab_details_page.dart'; // Contains LaboratoryScreen
// import 'lab_reports_page.dart'; // Contains LabReportsPage

// void main() {
//   runApp(
//     const MyApp(showLogin: true),
//   ); // Change to false to open LaboratoryScreen first
// }

// class MyApp extends StatelessWidget {
//   final bool showLogin;

//   const MyApp({super.key, required this.showLogin});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Medichive',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: const Color(0xFFEFF6F9),
//       ),
//       home: showLogin ? const LoginScreen() : const LaboratoryScreen(),
//     );
//   }
// }

// lib/main.dart
import 'package:flutter/material.dart';
import 'laboratory_login_page.dart';
import 'lab_details_page.dart';
import 'lab_report.dart' as report1;
import 'lab_reports_page.dart' as report2;
import 'qr_scan_page.dart';
import 'required_lab_report_page.dart';
import 'complain_support_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medichive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFEFF6F9),
        fontFamily: 'Arial',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/lab': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String?;
          return LaboratoryScreen(userId: args);
        },
        '/reports':
            (context) =>
                const report1.LabReportsPage(), // ✅ from lab_report.dart
        '/alternate':
            (context) =>
                const report2.LabReportsPage(), // ✅ from lab_reports_page.dart
        '/qr': (context) => const QRScanPage(),
        '/required': (context) => const RequiredLabReportPage(),
        '/complain': (context) => const ComplainSupportPage(),
      },
    );
  }
}
