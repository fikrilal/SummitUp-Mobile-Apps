import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TripDetailsService {
  final String baseUrl = dotenv.env['API_URL']!;

  Future<Map<String, dynamic>> fetchTripDetails(int tripId) async {
    final response = await http
        .get(Uri.parse('$baseUrl/get_trip_details.php?trip_id=$tripId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load trip details');
    }
  }
}
