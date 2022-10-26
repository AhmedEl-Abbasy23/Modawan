import 'package:flutter/foundation.dart';
import 'package:notes/core/local/sql_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLDatabase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDatabase();
      return _db;
    } else {
      return _db!;
    }
  }

  Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    // databasePath/databaseName
    String path = join(databasePath, SQLConstants.databaseName);
    Database notesDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      // onUpgrade: _onUpgrade, // only when you need it
    );
    return notesDatabase;
  }

  // onCreate
  _onCreate(Database db, int version) async {
    // batch => to create more than one table when upgrade version.
    Batch batch = db.batch();
    batch.execute(SQLConstants.createTableSql);
    await batch.commit();
    // Use this command if you want to create only one table in your app.
    // await db.execute(SQLConstants.createTableSql);
    if (kDebugMode) {
      print('${db.path}: Created');
    }
  }

  // onUpgrade
/*  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute(SQLConstants.upgradeTableSql(
      tableName: SQLConstants.notesTable,
      columnName: '',
      columnType: '',
    ));
    if (kDebugMode) {
      print('${db.path}: Upgraded');
    }
  }*/
}
