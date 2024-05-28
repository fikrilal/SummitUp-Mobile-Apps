import '../../../_core/data/data_sources/api_services.dart';
import '../../domain/entities/mountain.dart';

abstract class MountainRepository {
  Future<List<Mountain>> getMountains();
}

class MountainRepositoryImpl implements MountainRepository {
  final ApiService apiService;

  MountainRepositoryImpl(this.apiService);

  @override
  Future<List<Mountain>> getMountains() async {
    final mountainsData = await apiService.fetchMountains();
    return mountainsData.map<Mountain>((json) => Mountain.fromJson(json)).toList();
  }
}