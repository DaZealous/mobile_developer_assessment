import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'employee_database.db');

    return await openDatabase(path, version: 2, onCreate: _createDatabase);
  }


  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE employee_table (
        id INTEGER PRIMARY KEY,
        first_name TEXT,
        last_name TEXT,
        designation TEXT,
        level INTEGER,
        productivity_score REAL,
        current_salary TEXT,
        employment_status INTEGER
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('employee_table', row);
  }

  Future<void> insertAll(List<Map<String, dynamic>> employees) async {
    try {
      final db = await database;
      final batch = db.batch();

      for (final json in employees) {
            batch.insert('employee_table', json);
          }

      await batch.commit(noResult: true);
    } catch (e) {
      print('$e');
    }
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    final db = await database;
    return await db.query('employee_table');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
