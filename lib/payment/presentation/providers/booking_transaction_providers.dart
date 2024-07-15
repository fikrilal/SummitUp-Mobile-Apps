import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/booking_transaction_api_service.dart';
import '../../data/repositories/booking_transaction_repository.dart';
import '../../domain/entities/booking_transaction.dart';
import '../../domain/usecases/booking_transaction_usecase.dart';

final apiServiceProvider = Provider<BookingTransactionApiService>((ref) {
  return BookingTransactionApiService();
});

final bookingTransactionRepositoryProvider = Provider<BookingTransactionRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return BookingTransactionRepository(apiService);
});

final getBookingTransactionProvider = Provider<GetBookingTransaction>((ref) {
  return GetBookingTransaction(ref.read(bookingTransactionRepositoryProvider));
});

final bookingTransactionProvider = FutureProvider.family<BookingTransaction, int>((ref, id) {
  final getBookingTransaction = ref.read(getBookingTransactionProvider);
  return getBookingTransaction(id);
});
