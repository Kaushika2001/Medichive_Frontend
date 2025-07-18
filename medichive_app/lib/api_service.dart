import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:3000'; // Emulator
  // OR
  // final String baseUrl = 'http://192.168.x.x:3000'; // Use your machine's local IP

  Future<void> submitComplaint(String complaint) async {
    final url = Uri.parse('$baseUrl/lab/complaint');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'complain': complaint}),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to submit complaint: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> getProfile(String userId) async {
    final url = Uri.parse('$baseUrl/lab/profile/$userId');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch profile: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> getLabProfile(String userId) async {
    final url = Uri.parse('$baseUrl/lab/lab-profile/$userId');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch lab profile: ${response.body}');
    }
  }

  Future<List<dynamic>> getLabReports() async {
    final url = Uri.parse('$baseUrl/lab/lab-reports');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch lab reports: ${response.body}');
    }
  }

  Future<void> uploadLabReport(int id, String description, String name) async {
    final url = Uri.parse('$baseUrl/lab/lab-reports');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': id,
        'description': description,
        'name': name,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to upload report: ${response.body}');
    }
  }
}
