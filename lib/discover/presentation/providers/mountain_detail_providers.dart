import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summitup_mobile_apps/discover/domain/entities/mountain_details.dart';
import '../../data/repositories/mountain_detail_repository.dart';
import '../../domain/usecases/get_mountain_details.dart';
import 'api_services_provider.dart';

// Provider for the repository
final mountainDetailRepositoryProvider = Provider<MountainDetailRepository>((ref) {
  final apiService = ref.read(mountainsApiServiceProvider);  // Assume mountainsApiServiceProvider is defined
  return MountainDetailRepository(apiService);
});

// Provider for the use case
final getMountainDetailProvider = Provider<GetMountainDetail>((ref) {
  return GetMountainDetail(ref.read(mountainDetailRepositoryProvider));
});

// FutureProvider for fetching mountain details
final mountainDetailProvider = FutureProvider.family<MountainDetail, int>((ref, id) {
  final getMountainDetail = ref.read(getMountainDetailProvider);
  return getMountainDetail(id);
});
