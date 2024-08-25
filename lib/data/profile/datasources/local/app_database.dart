// database.dart

import 'dart:async';

import 'package:financial_app/data/profile/datasources/local/profile_local_datasource.dart';
import 'package:financial_app/data/profile/entity/profile_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [ProfileEntity])
abstract class AppDatabase extends FloorDatabase {
  ProfileDao get personDao;
}
