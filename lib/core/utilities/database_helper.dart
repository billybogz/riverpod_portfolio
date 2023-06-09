import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty/core/utilities/consts.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._instance();

  static final DatabaseHelper db = DatabaseHelper._instance();
  late Database _database;

  Future<Database> get database async {
    _database = await _initDB();

    return _database;
  }

  Future<Database> _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String databasePath = directory.path + DATABASE_NAME;

    Database db =
        await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(CREATE_CHARACTER_DATA);
  }

  Future<void> close() async {
    Database dbClient = await database;
    return dbClient.close();
  }
}
