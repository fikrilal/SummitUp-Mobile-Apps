import '../../domain/entities/trip_by_mountain_entities.dart';
import '../data_sources/trip_by_mountain_api_services.dart';

abstract class TripRepository {
  Future<List<Trip>> getTripsByMountain(int mountainId);
}

class TripRepositoryImpl implements TripRepository {
  final TripsApiService apiService;

  TripRepositoryImpl(this.apiService);

  @override
  Future<List<Trip>> getTripsByMountain(int mountainId) async {
    final jsonData = await apiService.fetchTripsByMountain(mountainId);
    return jsonData.map<Trip>((json) => Trip.fromJson(json)).toList();
  }
}
