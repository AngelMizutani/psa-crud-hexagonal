import 'package:crud_hex/application/adapters/pet_controller.dart';
import 'package:crud_hex/domain/pet_entity.dart';
import 'package:crud_hex/domain/ports/primary/pet_service.dart';
import 'package:crud_hex/domain/ports/secondary/pet_repository.dart';
import 'package:crud_hex/domain/service/pet_service_impl.dart';
import 'package:crud_hex/infra/pet_dto.dart';
import 'package:crud_hex/infra/pet_repository_impl.dart';
import 'package:flutter/material.dart';

PetRepositoryImpl _petRepository = PetRepositoryImpl();
PetServiceImpl _petService = PetServiceImpl(_petRepository);
PetController _controller = PetController(_petService);

class FormPet extends StatelessWidget {
  var pet = Pet();
  Widget createTextField(
      String label, String hintText, ValueChanged onChanged) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label, hintText: hintText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Register'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              createTextField(
                  "Pet's name", "Fill with the pet's name", (value) {}),
              createTextField(
                  "Owner's name", "Fill with the owner's name", (value) {}),
              createTextField(
                  "Species", "Fill with the species of the pet", (value) {}),
              ElevatedButton(
                  onPressed: () {
                    _controller.save(pet);
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('Salvar'))
            ],
          ),
        ),
      ),
    );
  }
}
