import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/create_transaction_record_api_service.dart';
import '../../data/repositories/create_transaction_record_repository.dart';

class CreateTransactionRecordNotifier extends StateNotifier<bool> {
  final CreateTransactionRecordRepository repository;

  CreateTransactionRecordNotifier(this.repository) : super(false);

  Future<int?> createTransactionRecord(Map<String, String> transactionData, BuildContext context) async {
    try {
      state = true;
      final transactionId = await repository.createTransactionRecord(transactionData);
      state = false;
      return transactionId;
    } catch (e) {
      state = false;
      _showErrorMessage(context, e.toString());
      return null;
    }
  }

  void _showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

final createTransactionRecordApiServiceProvider = Provider<CreateTransactionRecordApiService>((ref) {
  return CreateTransactionRecordApiService();
});

final createTransactionRecordRepositoryProvider = Provider<CreateTransactionRecordRepository>((ref) {
  final apiService = ref.watch(createTransactionRecordApiServiceProvider);
  return CreateTransactionRecordRepository(apiService);
});

final createTransactionRecordProvider = StateNotifierProvider<CreateTransactionRecordNotifier, bool>((ref) {
  final repository = ref.watch(createTransactionRecordRepositoryProvider);
  return CreateTransactionRecordNotifier(repository);
});
