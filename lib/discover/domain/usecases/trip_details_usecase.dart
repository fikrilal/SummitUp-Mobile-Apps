import '../../data/repositories/trip_details_repository.dart';
import '../entities/trip_details_entity.dart';

class GetTripDetail {
  final TripDetailRepository repository;

  GetTripDetail(this.repository);

  Future<TripDetailsEntity> call(int tripId) async {
    return await repository.getTripDetails(tripId);
  }
}
