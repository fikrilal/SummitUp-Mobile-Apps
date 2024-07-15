import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../_core/data/data_sources/api_service_impl.dart';

class BookingTransactionApiService extends ApiServiceImpl {
  Future<Map<String, dynamic>> fetchTransactionDetails(int id) async {
    final response = await get('get_booking_transaction.php?id=$id');
    return response;
  }
}
