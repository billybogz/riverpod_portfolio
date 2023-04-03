import 'package:rick_and_morty/core/utilities/consts.dart';
import 'package:rick_and_morty/core/utilities/database_helper.dart';
import 'package:rick_and_morty/features/home/domain/models/character/character_data.dart';
import 'package:sqflite/sqflite.dart';

class LocalHomeRepository {
  Future<Database> databaseFuture = DatabaseHelper.db.database;
  static const String tableName = 'Character';

  Future<List<CharacterModel>> getAllCharacters() async {
    late final List<CharacterModel> characterList;
    final Database database = await databaseFuture;
    final List<Map<String, Object?>> characterMap =
        await database.query(tableName);
    characterList = characterMap
        .map(
          (Map<String, Object?> character) =>
              CharacterModel.fromJson(character),
        )
        .toList();
    return characterList;
  }

  Future<void> updateLocalCharacterDatatable(
    List<CharacterModel> characterList, {
    bool isInitialList = false,
  }) async {
    final Database database = await databaseFuture;
    if (!isInitialList) {
      await database.execute('DROP TABLE IF EXISTS Character');
      await database.execute(CREATE_CHARACTER_DATA);
    }
    Batch batch = database.batch();
    characterList.forEach((CharacterModel character) async {
      batch.insert(
        tableName,
        <String, dynamic>{
          'name': character.name,
          'image': character.image,
          'status': character.status,
          'species': character.species,
          'type': character.type,
          'gender': character.gender,
          'created': character.created,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
    await batch.commit();
  }

  Future<dynamic> alterCharacterTable(String ColumneName) async {
    final Database dbClient = await databaseFuture;
    return await dbClient.execute('ALTER TABLE $tableName ADD '
        'COLUMN $ColumneName TEXT;');
  }
}
