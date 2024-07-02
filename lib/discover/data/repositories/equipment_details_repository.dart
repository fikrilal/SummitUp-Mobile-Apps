import '../../domain/entities/equipment_details_entity.dart';
import '../data_sources/equipment_details_api_service.dart';

class EquipmentDetailRepository {
  final EquipmentDetailsApiService apiService;

  EquipmentDetailRepository(this.apiService);

  Future<EquipmentDetail> getEquipmentDetails(int equipmentId) async {
    final jsonData = await apiService.fetchEquipmentDetails(equipmentId);
    return EquipmentDetail.fromJson(jsonData);
  }
}
