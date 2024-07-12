import '../models/create_transaction_record_api_service.dart';

class CreateTransactionRecordRepository {
  final CreateTransactionRecordApiService apiService;

  CreateTransactionRecordRepository(this.apiService);

  Future<int?> createTransactionRecord(Map<String, String> data) async {
    final response = await apiService.createTransactionRecord(data);
    if (response['message'] == 'Transaction created successfully.') {
      return int.parse(data['id']!);
    } else {
      throw Exception(response['message']);
    }
  }
}
