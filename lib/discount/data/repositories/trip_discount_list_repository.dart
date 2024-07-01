import '../../domain/entities/trip_discount_list_entity.dart';
import '../data_sources/trip_discount_list_api_sevices.dart';

abstract class DiscountTripRepository {
  Future<List<DiscountTrip>> getDiscountTrips();
}

class DiscountTripRepositoryImpl implements DiscountTripRepository {
  final TripDiscountListApiService apiService;

  DiscountTripRepositoryImpl(this.apiService);

  @override
  Future<List<DiscountTrip>> getDiscountTrips() async {
    final jsonData = await apiService.fetchDiscountTrips();
    return jsonData.map<DiscountTrip>((json) => DiscountTrip.fromJson(json)).toList();
  }
}
