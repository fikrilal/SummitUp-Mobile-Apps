import '../../data/repositories/mountain_detail_repository.dart';
import '../entities/mountain_details_entities.dart';

class GetMountainDetail {
  final MountainDetailRepository repository;

  GetMountainDetail(this.repository);

  Future<MountainDetail> call(int id) async {
    return await repository.getMountainDetails(id);
  }
}