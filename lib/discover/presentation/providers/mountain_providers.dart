import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summitup_mobile_apps/discover/data/data_sources/mountains_api_service.dart';
import '../../data/repositories/mountain_repository.dart';
import '../../domain/usecases/get_mountains.dart';

final apiServiceProvider = Provider((ref) => MountainsApiService());
final mountainRepositoryProvider = Provider((ref) => MountainRepositoryImpl(ref.watch(apiServiceProvider)));
final getMountainsProvider = Provider((ref) => GetMountains(ref.watch(mountainRepositoryProvider)));

final mountainsProvider = FutureProvider((ref) async {
  return ref.watch(getMountainsProvider)();
});