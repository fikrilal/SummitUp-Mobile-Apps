import '../../data/repositories/mountain_repository.dart';
import '../entities/mountain.dart';

class GetMountains {
  final MountainRepository repository;

  GetMountains(this.repository);

  Future<List<Mountain>> call() {
    return repository.getMountains();
  }
}