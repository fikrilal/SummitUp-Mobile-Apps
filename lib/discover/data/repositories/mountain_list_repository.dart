import 'package:summitup_mobile_apps/discover/data/data_sources/mountain_list_api_service.dart';
import '../../domain/entities/mountain_list_entities.dart';

abstract class MountainRepository {
  Future<List<Mountain>> getMountains();
}

class MountainRepositoryImpl implements MountainRepository {
  final MountainsApiService mountainsApiService;

  MountainRepositoryImpl(this.mountainsApiService);

  @override
  Future<List<Mountain>> getMountains() async {
    final mountainsData = await mountainsApiService.fetchMountains();
    return mountainsData.map<Mountain>((json) => Mountain.fromJson(json)).toList();
  }
}