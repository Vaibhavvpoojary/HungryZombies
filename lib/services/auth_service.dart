import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://10.0.2.2:3000/api/auth';

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': data['message'],
          'user': data['user'],
        };
      }

      return {
        'success': false,
        'message': data['message'] ?? 'Login failed',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Unable to connect to server',
      };
    }
  }

  static Future<Map<String, dynamic>> register({
  required String name,
  required String email,
  required String phone,
  required String password,
}) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      }),
    );

    final dynamic decodedBody = response.body.isNotEmpty
        ? jsonDecode(response.body)
        : <String, dynamic>{};

    final Map<String, dynamic> data = decodedBody is Map<String, dynamic>
        ? decodedBody
        : <String, dynamic>{};

    if (response.statusCode == 201) {
      return {
        'success': true,
        'message': data['message'] ?? 'Account created successfully',
        'user': data['user'],
      };
    }

    return {
      'success': false,
      'message': data['message'] ?? 'Registration failed',
    };
  } catch (e) {
    return {
      'success': false,
      'message': 'Unable to connect to server',
    };
  }
}
}