import '../../data/repositories/trip_discount_list_repository.dart';
import '../entities/trip_discount_list_entity.dart';

class GetDiscountTrips {
  final DiscountTripRepository repository;

  GetDiscountTrips(this.repository);

  Future<List<DiscountTrip>> call() {
    return repository.getDiscountTrips();
  }
}
