import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../_core/data/data_sources/api_services.dart';

class TransactionApiService extends ApiService {
  Future<List<dynamic>> fetchTransactionHistory(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/get_transaction_history.php?user_id=$userId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load transaction history');
    }
  }

  Future<Map<String, dynamic>> fetchTransactionDetails(int transactionId) async {
    final response = await http.get(Uri.parse('$baseUrl/get_transaction_details.php?transaction_id=$transactionId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load transaction details');
    }
  }
}
