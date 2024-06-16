import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/trip_details_api_service.dart';
import '../../data/repositories/trip_details_repository.dart';
import '../../domain/entities/trip_details_entity.dart';
import '../../domain/usecases/trip_details_usecase.dart';

final tripDetailsServiceProv = Provider((ref) => TripDetailsService());
final tripDetailRepositoryProv = Provider((ref) {
  final apiService = ref.read(tripDetailsServiceProv);
  return TripDetailRepository(apiService);
});
final getTripDetailProv = Provider((ref) {
  return GetTripDetail(ref.read(tripDetailRepositoryProv));
});
final tripDetailProvider = FutureProvider.family<TripDetailsEntity, int>((ref, tripId) {
  final getTripDetail = ref.read(getTripDetailProv);
  return getTripDetail(tripId);
});
