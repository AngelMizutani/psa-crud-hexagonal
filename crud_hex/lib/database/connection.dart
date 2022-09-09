import 'package:crud_hex/database/scripts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? database;

  static Future<Database> get() async {
    if (database == null) {
      var path = join(await getDatabasesPath(), 'database.db');

      database = await openDatabase(path, version: 1, onCreate: (db, version) {
        db.execute(createTablePet);
        db.execute(insertPet1);
        db.execute(insertPet2);
      });
    }

    return database!;
  }
}
