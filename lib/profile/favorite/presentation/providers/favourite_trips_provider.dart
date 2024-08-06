import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/favorite_trips_api_service.dart';
import '../../data/repositories/favourite_trips_repository.dart';
import '../../domain/entities/favourite_trips_entity.dart';
import '../../domain/usecases/favourite_trips_usecase.dart';

final favouriteTripsApiServiceProvider = Provider((ref) => FavouriteTripsApiService());
final favouriteTripRepositoryProvider = Provider((ref) => FavouriteTripRepositoryImpl(ref.watch(favouriteTripsApiServiceProvider)));
final getFavouriteTripsProvider = Provider((ref) => GetFavouriteTrips(ref.watch(favouriteTripRepositoryProvider)));
final deleteFavouriteTripProvider = Provider((ref) => DeleteFavouriteTrip(ref.watch(favouriteTripRepositoryProvider)));

final favouriteTripsProvider = FutureProvider.family<List<FavouriteTrip>, int>((ref, userId) {
  return ref.watch(getFavouriteTripsProvider).call(userId);
});
