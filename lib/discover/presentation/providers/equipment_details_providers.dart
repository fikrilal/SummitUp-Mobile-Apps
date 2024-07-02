import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/equipment_details_api_service.dart';
import '../../data/repositories/equipment_details_repository.dart';
import '../../domain/entities/equipment_details_entity.dart';
import '../../domain/usecases/equipment_details_usecases.dart';

final equipmentDetailsApiServiceProvider = Provider((ref) => EquipmentDetailsApiService());
final equipmentDetailRepositoryProvider = Provider((ref) => EquipmentDetailRepository(ref.watch(equipmentDetailsApiServiceProvider)));
final getEquipmentDetailProvider = Provider((ref) => GetEquipmentDetail(ref.watch(equipmentDetailRepositoryProvider)));

final equipmentDetailProvider = FutureProvider.family<EquipmentDetail, int>((ref, equipmentId) async {
  return ref.watch(getEquipmentDetailProvider)(equipmentId);
});
