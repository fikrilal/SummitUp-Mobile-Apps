import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../_core/data/data_sources/api_services.dart';
import '../../data/repositories/mountain_repository.dart';
import '../../domain/usecases/get_mountains.dart';

final apiServiceProvider = Provider((ref) => ApiService());
final mountainRepositoryProvider = Provider((ref) => MountainRepositoryImpl(ref.watch(apiServiceProvider)));
final getMountainsProvider = Provider((ref) => GetMountains(ref.watch(mountainRepositoryProvider)));

final mountainsProvider = FutureProvider((ref) async {
  return ref.watch(getMountainsProvider)();
});