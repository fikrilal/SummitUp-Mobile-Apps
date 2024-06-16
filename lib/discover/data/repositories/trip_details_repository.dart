
import '../../domain/entities/trip_details_entity.dart';
import '../data_sources/trip_details_api_service.dart';

class TripDetailRepository {
  final TripDetailsService apiService;

  TripDetailRepository(this.apiService);

  Future<TripDetailsEntity> getTripDetails(int tripId) async {
    final jsonData = await apiService.fetchTripDetails(tripId);
    return TripDetailsEntity.fromJson(jsonData);
  }
}
