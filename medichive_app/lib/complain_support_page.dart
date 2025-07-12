// lib/complain_support_page.dart
import 'package:flutter/material.dart';
import 'api_service.dart'; 

class ComplainSupportPage extends StatefulWidget {
  const ComplainSupportPage({super.key});

  @override
  State<ComplainSupportPage> createState() => _ComplainSupportPageState();
}

class _ComplainSupportPageState extends State<ComplainSupportPage> {
  final _complaintController = TextEditingController();

  final _apiService = ApiService(); // Assuming you have an ApiService class to handle API requests

  Future<void> _submitComplaint() async {
    final complaintText = _complaintController.text.trim();
    if (complaintText.isNotEmpty) {
      try {
        await _apiService.submitComplaint(complaintText);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Complaint submitted successfully")),
        );
        _complaintController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to submit complaint: $e")),
        );
      }
    }
  }

  @override
  void dispose() {
    _complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complains and Support"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Write Complains",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _complaintController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Enter your complaint...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: _submitComplaint,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[900],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Send", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
