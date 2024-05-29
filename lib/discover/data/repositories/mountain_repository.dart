import 'package:summitup_mobile_apps/discover/data/data_sources/mountains_api_service.dart';
import '../../domain/entities/mountain.dart';

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