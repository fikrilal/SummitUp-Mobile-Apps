import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../_core/data/data_sources/api_services.dart';

class MountainsApiService extends ApiService {
  Future<List<dynamic>> fetchMountains() async {
    final response = await http.get(Uri.parse('$baseUrl/get_mountains.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load mountains');
    }
  }
}