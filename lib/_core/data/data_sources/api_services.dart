import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ApiService {
  final String baseUrl = dotenv.env['API_URL']!;

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    print('GET $endpoint: ${response.statusCode} - ${response.body}');
    return _processResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, String> data) async {
    final response = await http.post(Uri.parse('$baseUrl/$endpoint'), body: data);
    print('POST $endpoint: ${response.statusCode} - ${response.body}');
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      print('Failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load data (from api): ${response.body}');
    }
  }
}
