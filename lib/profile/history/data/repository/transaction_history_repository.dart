import '../../domain/entities/transaction_history_entity.dart';
import '../data_sources/trasaction_history_api_service.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getTransactionHistory(int userId);
}

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionApiService apiService;

  TransactionRepositoryImpl(this.apiService);

  @override
  Future<List<Transaction>> getTransactionHistory(int userId) async {
    final transactionData = await apiService.fetchTransactionHistory(userId);
    return transactionData.map<Transaction>((json) => Transaction.fromJson(json)).toList();
  }
}
