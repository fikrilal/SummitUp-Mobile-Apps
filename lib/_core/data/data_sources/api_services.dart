import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = dotenv.env['API_URL']!;

  Future<List<dynamic>> fetchMountains() async {
    final response = await http.get(Uri.parse('$baseUrl/mountains'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load mountains');
    }
  }
}
