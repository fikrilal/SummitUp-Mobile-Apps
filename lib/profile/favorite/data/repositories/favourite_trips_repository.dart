import '../../domain/entities/favourite_trips_entity.dart';
import '../data_sources/favorite_trips_api_service.dart';

abstract class FavouriteTripRepository {
  Future<List<FavouriteTrip>> getFavouriteTrips(int userId);
}

class FavouriteTripRepositoryImpl implements FavouriteTripRepository {
  final FavouriteTripsApiService apiService;

  FavouriteTripRepositoryImpl(this.apiService);

  @override
  Future<List<FavouriteTrip>> getFavouriteTrips(int userId) async {
    final favouriteTripsData = await apiService.fetchFavouriteTrips(userId);
    return favouriteTripsData.map<FavouriteTrip>((json) => FavouriteTrip.fromJson(json)).toList();
  }
}
