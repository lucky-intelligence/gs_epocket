import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:playrooms/components/database/models/user.dart';
import 'package:sqflite/sqflite.dart';

class LocalData {
  
  LocalData._();
  static final LocalData db = LocalData._();

  static User user;

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
    return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "5175136_db");    
    return await openDatabase(path, version: 1, onCreate: (db, version) async{
      await db.execute('''
        CREATE TABLE IF NOT EXISTS user (
          session TEXT,
          userId TEXT,
          name TEXT,
          firstLastName TEXT,
          secondLastName TEXT,
          email TEXT,
          mobile TEXT,
          picture TEXT
        );
      ''');
    });
  }

  removeSession() async {
    final db = await database;
    await db.delete('user');
  }

  queryUser() async {
    final db = await database;
    return await db.query("user");
  }

  addTempUser(User u){
    LocalData.user = u;
  }

  addUser(User u) async{
    LocalData.user = u;
    final db = await database;    
    await db.insert("user", u.toJson());
  }
}