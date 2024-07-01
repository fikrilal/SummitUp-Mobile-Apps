import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../_core/data/data_sources/api_services.dart';

class TripDiscountListApiService extends ApiService {
  Future<List<dynamic>> fetchDiscountTrips() async {
    final uri = Uri.parse('$baseUrl/get_discount_trips.php');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load discount trips');
    }
  }
}
