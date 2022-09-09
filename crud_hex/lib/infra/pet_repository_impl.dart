import 'package:crud_hex/database/connection.dart';
import 'package:crud_hex/domain/pet_entity.dart';
import 'package:crud_hex/domain/ports/secondary/pet_repository.dart';
import 'package:crud_hex/infra/pet_dto.dart';

class PetRepositoryImpl implements PetRepository {
  // final PetDTO _petDTO;

  // PetRepositoryImpl(this._petDTO);

  @override
  void delete(int id) async {
    var db = await Connection.get();
    String sql = 'DELETE FROM pet WHERE id = ?';
    await db.rawDelete(sql, [id]);
  }

  @override
  Future<List<Pet>> list() async {
    var db = await Connection.get();

    List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM pet');
    List<Pet> pets = List.generate(result.length, (index) {
      var pet = result[index];
      return Pet(
          id: pet['id'],
          petName: pet['pet_name'],
          ownerName: pet['owner_name'],
          species: pet['species']);
    });

    return pets;
  }

  @override
  void save(Pet pet) async {
    var db = await Connection.get();
    String sql;

    if (pet.id == null) {
      sql = 'INSERT INTO pet(pet_name, owner_name, species) VALUES (?, ?, ?)';
      db.rawInsert(sql, [pet.petName, pet.ownerName, pet.species]);
    } else {
      sql =
          'UPDATE pet SET pet_name = ?, owner_name = ?, species = ? WHERE id = ?';
      db.rawUpdate(sql, [pet.petName, pet.ownerName, pet.species, pet.id]);
    }
  }
}
