const createTablePet = '''
  CREATE TABLE pet(
            id INTEGER PRIMARY KEY
            , pet_name TEXT NOT NULL
            , owner_name TEXT NOT NULL
            , species
          )
''';

const insertPet1 = '''
  INSERT INTO pet (pet_name, owner_name, species) VALUES ("Zelda", "Angelica", "Gato")
''';

const insertPet2 = '''
  INSERT INTO pet (pet_name, owner_name, species) VALUES ("Fiona", "Angelica", "Gato")
''';
