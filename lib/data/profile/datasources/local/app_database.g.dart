// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProfileDao? _personDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProfileEntity` (`id` INTEGER NOT NULL, `fullname` TEXT, `bornDate` TEXT, `sex` TEXT, `nik` TEXT, `imagePath` TEXT, `address` TEXT, `bankAccountNumber` TEXT, `backBranchAccount` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProfileDao get personDao {
    return _personDaoInstance ??= _$ProfileDao(database, changeListener);
  }
}

class _$ProfileDao extends ProfileDao {
  _$ProfileDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _profileEntityInsertionAdapter = InsertionAdapter(
            database,
            'ProfileEntity',
            (ProfileEntity item) => <String, Object?>{
                  'id': item.id,
                  'fullname': item.fullname,
                  'bornDate': item.bornDate,
                  'sex': item.sex,
                  'nik': item.nik,
                  'imagePath': item.imagePath,
                  'address': item.address,
                  'bankAccountNumber': item.bankAccountNumber,
                  'backBranchAccount': item.backBranchAccount
                }),
        _profileEntityUpdateAdapter = UpdateAdapter(
            database,
            'ProfileEntity',
            ['id'],
            (ProfileEntity item) => <String, Object?>{
                  'id': item.id,
                  'fullname': item.fullname,
                  'bornDate': item.bornDate,
                  'sex': item.sex,
                  'nik': item.nik,
                  'imagePath': item.imagePath,
                  'address': item.address,
                  'bankAccountNumber': item.bankAccountNumber,
                  'backBranchAccount': item.backBranchAccount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProfileEntity> _profileEntityInsertionAdapter;

  final UpdateAdapter<ProfileEntity> _profileEntityUpdateAdapter;

  @override
  Future<ProfileEntity?> findPersonById(int id) async {
    return _queryAdapter.query('SELECT * FROM ProfileEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ProfileEntity(
            id: row['id'] as int,
            fullname: row['fullname'] as String?,
            bornDate: row['bornDate'] as String?,
            sex: row['sex'] as String?,
            nik: row['nik'] as String?,
            imagePath: row['imagePath'] as String?,
            address: row['address'] as String?,
            bankAccountNumber: row['bankAccountNumber'] as String?,
            backBranchAccount: row['backBranchAccount'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertProfile(ProfileEntity profile) async {
    await _profileEntityInsertionAdapter.insert(
        profile, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateProfile(ProfileEntity profile) async {
    await _profileEntityUpdateAdapter.update(
        profile, OnConflictStrategy.replace);
  }
}
