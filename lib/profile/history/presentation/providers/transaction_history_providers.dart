import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/trasaction_history_api_service.dart';
import '../../data/repository/transaction_history_repository.dart';
import '../../domain/entities/transaction_history_entity.dart';
import '../../domain/usecases/get_transaction_history_usecase.dart';

final transactionApiServiceProvider = Provider((ref) => TransactionApiService());
final transactionRepositoryProvider =
    Provider((ref) => TransactionRepositoryImpl(ref.watch(transactionApiServiceProvider)));
final getTransactionHistoryProvider =
    Provider((ref) => GetTransactionHistory(ref.watch(transactionRepositoryProvider)));
final getTransactionDetailsProvider =
    Provider((ref) => GetTransactionDetails(ref.watch(transactionRepositoryProvider)));

final transactionHistoryProvider = FutureProvider.family<List<Transaction>, int>((ref, userId) {
  return ref.watch(getTransactionHistoryProvider).call(userId);
});

final transactionDetailsProvider = FutureProvider.family<Transaction, int>((ref, transactionId) {
  return ref.watch(getTransactionDetailsProvider).call(transactionId);
});
