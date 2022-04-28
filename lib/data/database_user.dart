import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/data/model_user.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

//INTEGER PRIMARY KEY AUTOINCREMENT
final String tableUser = 'table_user';
final String Id = 'id';
final String Name = 'name';
final String Email = 'email';
final String PhoneNumber = 'phone_number';
final String Avatar = 'avatar';
final String Bearer = 'bearer';
final String CreatedAt = 'created_at';
final String UpdatedAt = 'updated_at';

class DatabaseUser {
  static Database? _database;
  static DatabaseUser? databaseUser;

  DatabaseUser._createInstance();

  factory DatabaseUser() {
    if (databaseUser == null) {
      databaseUser = DatabaseUser._createInstance();
    }
    return databaseUser!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = p.join(databasesPath, 'database_user.db');

      var database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute('''
          create table $tableUser ( 
          $Id INTEGER PRIMARY KEY, 
          $Name text not null, 
          $Email text not null, 
          $PhoneNumber text not null, 
          $Avatar text not null, 
          $Bearer text not null, 
          $CreatedAt text not null, 
          $UpdatedAt text not null 
           )
        ''');
        },
      );
      // print('------database database : $database');
      return database;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return null!;
    }
  }

  Future<bool> AddUpdateRecord(ModalUser user_info) async {
    try {
      var db = await this.database;
      getCount().then((value) async {
        if (value == 0) {
          await db.insert(tableUser, user_info.toMap());
          print("HelloDrawer Add ${user_info.toMap()}");
          return true;
        } else {
          await db.update(tableUser, user_info.toMap(), where: '$Id = 1');
          print("HelloDrawer Update ${user_info.toMap()}");
          return true;
        }
      });
      return false;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return false;
    }
  }

  Future<bool> AddRecord(ModalUser user_info) async {
    try {
      var db = await this.database;
      await db.insert(tableUser, user_info.toMap());
      return true;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return false;
    }
  }

  Future<bool> UpdateRecord(ModalUser user_info) async {
    try {
      var db = await this.database;
      await db.update(tableUser, user_info.toMap(),
          where: '$Id = ?', whereArgs: [user_info.id]);
      return true;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return false;
    }
  }

  Future<bool> DeleteRecord(String id) async {
    try {
      var db = await this.database;
      await db.delete(tableUser, where: '$Id = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return false;
    }
  }

  Future<bool> DeleteAllRecord() async {
    try {
      var db = await this.database;
      await db.delete(tableUser);
      return true;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return false;
    }
  }

  Future<ModalUser> GetSingleRecord() async {
    try {
      ModalUser? modalUser;
      var db = await this.database;
      var result = await db.query(tableUser, where: "$Id = 1");
      print("SifatLog Values result ${result}");

      if (result.length > 0) {
        for (int i = 0; i < result.length; i++) {
          var modal = ModalUser.fromMap(result[i]);
          modalUser = modal;
          break;
        }
        print("SifatLog Values modalUser ${modalUser}");
        return modalUser!;
      } else {
        return null!;
      }
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return null!;
    }
  }

  Widget MyButton({required text}) {
    return TextButton(onPressed: () {}, child: Text(text));
  }

  Future<List<ModalUser>> GetAllRecord() async {
    try {
      List<ModalUser> modalUserData = [];
      var db = await this.database;
      var result = await db.query(tableUser);
      if (result.length > 0) {
        for (int i = 0; i < result.length; i++) {
          var modal = ModalUser.fromMap(result[i]);
          modalUserData.add(modal);
        }
        print("SifatLog Values length ${modalUserData.length}");
        return modalUserData;
      } else {
        return null!;
      }
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return null!;
    }
  }

  Future<int> getCount() async {
    try {
      var db = await this.database;
      var result = await db.query(tableUser);
      return result.length;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return 0;
    }
  }
}
