import 'package:crud_hex/domain/pet_entity.dart';

class PetDTO {
  int? id;
  String? petName;
  String? ownerName;
  String? species;

  PetDTO({this.id, this.petName, this.ownerName, this.species});

  Pet convertToObject(
      int id, String petName, String ownerName, String species) {
    return Pet(
        id: id, petName: petName, ownerName: ownerName, species: species);
  }
}
