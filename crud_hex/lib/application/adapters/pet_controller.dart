import 'package:crud_hex/domain/pet_entity.dart';
import 'package:crud_hex/domain/ports/primary/pet_service.dart';
import 'package:crud_hex/domain/service/pet_service_impl.dart';

class PetController {
  final PetServiceImpl _petService;

  PetController(this._petService);

  void save(Pet pet) {
    _petService.save(pet);
  }

  void delete(int id) {
    _petService.delete(id);
  }

  Future<List<Pet>> list() {
    return _petService.list();
  }
}
