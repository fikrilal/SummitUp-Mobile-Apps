import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../_core/data/data_sources/api_services.dart';

class EquipmentDetailsApiService extends ApiService {
  Future<Map<String, dynamic>> fetchEquipmentDetails(int equipmentId) async {
    final uri = Uri.parse('$baseUrl/get_equipment_details.php?equipment_id=$equipmentId');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load equipment details');
    }
  }
}
