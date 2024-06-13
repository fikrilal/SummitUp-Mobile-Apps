import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/trip_by_mountain_api_services.dart';
import '../../data/repositories/trip_by_mountain_repository.dart';
import '../../domain/entities/trip_by_mountain_entities.dart';
import '../../domain/usecases/trip_by_mountain_usecases.dart';

final tripsApiServiceProvider = Provider((ref) => TripsApiService());
final tripRepositoryProvider = Provider((ref) => TripRepositoryImpl(ref.watch(tripsApiServiceProvider)));
final getTripsByMountainProvider = Provider((ref) => GetTripsByMountain(ref.watch(tripRepositoryProvider)));

final tripsProvider = FutureProvider.family<List<Trip>, int>((ref, mountainId) async {
  return ref.watch(getTripsByMountainProvider)(mountainId);
});
