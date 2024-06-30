
import '../../data/repositories/equipment_by_mountain_repository.dart';
import '../entities/equipment_by_mountain_entity.dart';

class GetEquipmentsByMountain {
  final EquipmentRepository repository;

  GetEquipmentsByMountain(this.repository);

  Future<List<Equipment>> call(int mountainId) {
    return repository.getEquipmentsByMountain(mountainId);
  }
}
