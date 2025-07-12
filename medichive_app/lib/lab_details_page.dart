
import 'package:flutter/material.dart';
import 'lab_report.dart'; 
import 'qr_scan_page.dart';
import 'complain_support_page.dart';

class LaboratoryScreen extends StatelessWidget {
  const LaboratoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildButton(context, "Scan QR code", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QRScanPage()),
              );
            }),
            const SizedBox(height: 16),
            _buildButton(context, "Your Profile", () {
              // TODO: Add your profile navigation logic
            }),
            const SizedBox(height: 16),
            _buildButton(context, "View Reports", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LabReportsPage()), // from lab_report.dart
              );
            }),
            const SizedBox(height: 16),
            _buildButton(context, "Complains and Support", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ComplainSupportPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
