import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/trip_discount_list_api_sevices.dart';
import '../../data/repositories/trip_discount_list_repository.dart';
import '../../domain/entities/trip_discount_list_entity.dart';
import '../../domain/usecases/trip_discount_list_usecase.dart';

final tripDiscountListApiServiceProvider = Provider((ref) => TripDiscountListApiService());
final discountTripRepositoryProvider = Provider((ref) => DiscountTripRepositoryImpl(ref.watch(tripDiscountListApiServiceProvider)));
final getDiscountTripsProvider = Provider((ref) => GetDiscountTrips(ref.watch(discountTripRepositoryProvider)));

final discountTripsProvider = FutureProvider<List<DiscountTrip>>((ref) async {
  return ref.watch(getDiscountTripsProvider)();
});
