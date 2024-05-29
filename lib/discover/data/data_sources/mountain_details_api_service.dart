import '../../../_core/data/data_sources/api_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MountainsApiService extends ApiService {
  Future<Map<String, dynamic>> fetchMountainDetails(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/get_mountains_detail.php?id=$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load mountain details');
    }
  }
}