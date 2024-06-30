import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/equipment_by_mountain_api_services.dart';
import '../../data/repositories/equipment_by_mountain_repository.dart';
import '../../domain/entities/equipment_by_mountain_entity.dart';
import '../../domain/usecases/equipment_by_mountain_usecase.dart';

final equipmentsApiServiceProvider = Provider((ref) => EquipmentsApiService());
final equipmentRepositoryProvider = Provider((ref) => EquipmentRepositoryImpl(ref.watch(equipmentsApiServiceProvider)));
final getEquipmentsByMountainProvider = Provider((ref) => GetEquipmentsByMountain(ref.watch(equipmentRepositoryProvider)));

final equipmentsProvider = FutureProvider.family<List<Equipment>, int>((ref, mountainId) async {
  return ref.watch(getEquipmentsByMountainProvider)(mountainId);
});
