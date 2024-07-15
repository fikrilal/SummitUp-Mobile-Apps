import '../../data/repositories/booking_transaction_repository.dart';
import '../entities/booking_transaction.dart';

class GetBookingTransaction {
  final BookingTransactionRepository repository;

  GetBookingTransaction(this.repository);

  Future<BookingTransaction> call(int id) async {
    return await repository.getTransactionDetails(id);
  }
}
