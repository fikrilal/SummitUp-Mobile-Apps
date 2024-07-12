import '../../../../_core/data/data_sources/api_services.dart';


class CreateTransactionRecordApiService extends ApiService {
  Future<Map<String, dynamic>> createTransactionRecord(Map<String, String> data) async {
    return await post('create_booking_transaction.php', data);
  }
}