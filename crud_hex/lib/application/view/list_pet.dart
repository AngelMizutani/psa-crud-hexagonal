import 'package:crud_hex/application/adapters/pet_controller.dart';
import 'package:crud_hex/domain/ports/primary/pet_service.dart';
import 'package:crud_hex/domain/ports/secondary/pet_repository.dart';
import 'package:crud_hex/domain/service/pet_service_impl.dart';
import 'package:crud_hex/infra/pet_repository_impl.dart';
import 'package:flutter/material.dart';

PetRepositoryImpl _petRepository = PetRepositoryImpl();
PetServiceImpl _petService = PetServiceImpl(_petRepository);
PetController _controller = PetController(_petService);

class ListPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pets list'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/formPet'),
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: _controller.list(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            //Object pets = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var pet = snapshot.data[index];
                return ListTile(
                  title: Text('Pet: ${snapshot.data[0].toString()}'),
                  subtitle: Text('Owner: ${snapshot.data[1].toString()}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
