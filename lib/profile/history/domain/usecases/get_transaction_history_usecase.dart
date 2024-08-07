import '../../data/repository/transaction_history_repository.dart';
import '../entities/transaction_history_entity.dart';

class GetTransactionHistory {
  final TransactionRepository repository;

  GetTransactionHistory(this.repository);

  Future<List<Transaction>> call(int userId) {
    return repository.getTransactionHistory(userId);
  }
}

class GetTransactionDetails {
  final TransactionRepository repository;

  GetTransactionDetails(this.repository);

  Future<Transaction> call(int transactionId) {
    return repository.getTransactionDetails(transactionId);
  }
}