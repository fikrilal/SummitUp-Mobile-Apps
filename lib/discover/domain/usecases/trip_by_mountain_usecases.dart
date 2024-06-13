import '../../data/repositories/trip_by_mountain_repository.dart';
import '../entities/trip_by_mountain_entities.dart';

class GetTripsByMountain {
  final TripRepository repository;

  GetTripsByMountain(this.repository);

  Future<List<Trip>> call(int mountainId) {
    return repository.getTripsByMountain(mountainId);
  }
}
