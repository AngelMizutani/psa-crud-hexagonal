import '../../pet_entity.dart';

abstract class PetService {
  Future<List<Pet>> list();
  void save(Pet pet);
  void delete(int id);
}
