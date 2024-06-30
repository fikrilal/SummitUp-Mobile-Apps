

import '../../domain/entities/equipment_by_mountain_entity.dart';
import '../data_sources/equipment_by_mountain_api_services.dart';

abstract class EquipmentRepository {
  Future<List<Equipment>> getEquipmentsByMountain(int mountainId);
}

class EquipmentRepositoryImpl implements EquipmentRepository {
  final EquipmentsApiService apiService;

  EquipmentRepositoryImpl(this.apiService);

  @override
  Future<List<Equipment>> getEquipmentsByMountain(int mountainId) async {
    final jsonData = await apiService.fetchEquipmentsByMountain(mountainId);
    return jsonData.map<Equipment>((json) => Equipment.fromJson(json)).toList();
  }
}
