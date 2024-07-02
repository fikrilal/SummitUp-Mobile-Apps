import '../../data/repositories/equipment_details_repository.dart';
import '../entities/equipment_details_entity.dart';

class GetEquipmentDetail {
  final EquipmentDetailRepository repository;

  GetEquipmentDetail(this.repository);

  Future<EquipmentDetail> call(int equipmentId) async {
    return await repository.getEquipmentDetails(equipmentId);
  }
}
