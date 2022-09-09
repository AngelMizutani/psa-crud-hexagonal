import 'package:crud_hex/domain/pet_entity.dart';
import 'package:crud_hex/domain/ports/primary/pet_service.dart';
import 'package:crud_hex/domain/ports/secondary/pet_repository.dart';
import 'package:crud_hex/infra/pet_repository_impl.dart';

class PetServiceImpl implements PetService {
  final PetRepositoryImpl _petRepository;

  PetServiceImpl(this._petRepository);

  @override
  void delete(int id) {
    return _petRepository.delete(id);
  }

  @override
  Future<List<Pet>> list() {
    return _petRepository.list();
  }

  @override
  void save(Pet pet) {
    return _petRepository.save(pet);
  }
}
