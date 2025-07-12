import 'package:flutter/material.dart';

class RequiredLabReportPage extends StatelessWidget {
  const RequiredLabReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 16),

              // Title
              const Center(
                child: Text(
                  'Required Lab Reports',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Report List Box
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      )
                    ],
                  ),
                  child: const Text(
                    '1. Thyroid function tests\n2. Blood count\n3. Basic metabolic panel',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const Spacer(),

              // Upload Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Add upload functionality
                  },
                  icon: const Icon(Icons.upload),
                  label: const Text('Upload'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[900],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Optional Back Text
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
