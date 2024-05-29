import '../../domain/entities/mountain_details.dart';
import '../data_sources/mountain_details_api_service.dart';

class MountainDetailRepository {
  final MountainsApiService apiService;

  MountainDetailRepository(this.apiService);

  Future<MountainDetail> getMountainDetails(int id) async {
    final jsonData = await apiService.fetchMountainDetails(id);
    return MountainDetail.fromJson(jsonData);
  }
}