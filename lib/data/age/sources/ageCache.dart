// this might be against agifys TOS

import 'dart:async';

import 'package:howoldami/data/age/ageData.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AgeCache {
  static const noCountry =
      worldCountry; // yes it could simply be left null, but this is more explicit
  FutureOr<Database> get database async =>
      _database ??
      openDatabase(
        join(await getDatabasesPath(), 'namecountryage_database.db'),
        onCreate: (db, version) {
          return db.execute(
            '''
              CREATE TABLE peoples_age (
                  name TEXT NOT NULL,
                  $countryKey TEXT NOT NULL DEFAULT '$noCountry',
                  age INTEGER NOT NULL,
                  count INTEGER NOT NULL,
                  PRIMARY KEY (name, $countryKey)
              );
            ''',
          );
        },
        version: 1,
      ).then<Database>((value) {
        _database = value;
        return value;
      }) as FutureOr<Database>;
  Database? _database;

  Future<AgeData?> getAge({required String name, String? country}) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'peoples_age',
      where: 'name = ? AND $countryKey = ?',
      whereArgs: [name, country ?? noCountry],
    );
    if (maps.isEmpty) {
      return null;
    }
    return AgeData.fromJson(maps.first);
  }

  Future<void> setAge(AgeData data) async {
    final db = await database;
    db.insert(
      'peoples_age',
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
