import '../../domain/entities/booking_transaction.dart';
import '../models/booking_transaction_api_service.dart';

class BookingTransactionRepository {
  final BookingTransactionApiService apiService;

  BookingTransactionRepository(this.apiService);

  Future<BookingTransaction> getTransactionDetails(int id) async {
    final jsonData = await apiService.fetchTransactionDetails(id);
    return BookingTransaction.fromJson(jsonData);
  }
}
