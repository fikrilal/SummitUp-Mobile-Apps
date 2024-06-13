import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../_core/data/data_sources/api_services.dart';

class TripsApiService extends ApiService {
  Future<List<dynamic>> fetchTripsByMountain(int mountainId) async {
    final uri = Uri.parse('$baseUrl/get_trips_by_mountain.php?mountain_id=$mountainId');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load trips');
    }
  }
}
