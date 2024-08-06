import '../../data/repositories/favourite_trips_repository.dart';
import '../entities/favourite_trips_entity.dart';

class GetFavouriteTrips {
  final FavouriteTripRepository repository;

  GetFavouriteTrips(this.repository);

  Future<List<FavouriteTrip>> call(int userId) {
    return repository.getFavouriteTrips(userId);
  }
}
