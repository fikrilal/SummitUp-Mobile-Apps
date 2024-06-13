import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summitup_mobile_apps/discover/data/data_sources/mountain_list_api_service.dart';
import '../../data/repositories/mountain_list_repository.dart';
import '../../domain/usecases/mountain_list_usecases.dart';

final apiServiceProvider = Provider((ref) => MountainsApiService());
final mountainRepositoryProvider = Provider((ref) => MountainRepositoryImpl(ref.watch(apiServiceProvider)));
final getMountainsProvider = Provider((ref) => GetMountains(ref.watch(mountainRepositoryProvider)));

final mountainsProvider = FutureProvider((ref) async {
  return ref.watch(getMountainsProvider)();
});