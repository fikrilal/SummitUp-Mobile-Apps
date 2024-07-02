import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ApiService {
  final String baseUrl = dotenv.env['API_URL']!;

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data'); 
    }
  }

  Future<dynamic> post(String endpoint, Map<String, String> data) async {
    final response = await http.post(Uri.parse('$baseUrl/$endpoint'), body: data);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}