import '../../data/repositories/mountain_list_repository.dart';
import '../entities/mountain_list_entities.dart';

class GetMountains {
  final MountainRepository repository;

  GetMountains(this.repository);

  Future<List<Mountain>> call() {
    return repository.getMountains();
  }
}