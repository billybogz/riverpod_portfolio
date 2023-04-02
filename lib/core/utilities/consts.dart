// ignore_for_file: constant_identifier_names

const String DATABASE_NAME = '/offline_first.db';

const String CREATE_CHARACTER_DATA = '''
    CREATE TABLE IF NOT EXISTS Character (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      image TEXT,
      status TEXT,
      species TEXT,
      type TEXT,
      gender TEXT,
      created TEXT
    )
''';
