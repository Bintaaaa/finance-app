import 'package:financial_app/data/profile/datasources/local/app_database.dart';
import 'package:financial_app/data/profile/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity?> getProfile(int id);
  Future<void> insertProfile(ProfileEntity profile);
  Future<void> updateProfile(ProfileEntity profile);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final AppDatabase appDatabase;

  ProfileRepositoryImpl({required this.appDatabase});

  @override
  Future<ProfileEntity?> getProfile(int id) async {
    try {
      final db = appDatabase.personDao;
      return db.findPersonById(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> insertProfile(ProfileEntity profile) async {
    try {
      final db = appDatabase.personDao;
      return db.insertProfile(profile);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfile(ProfileEntity profile) {
    try {
      final db = appDatabase.personDao;
      return db.insertProfile(profile);
    } catch (e) {
      rethrow;
    }
  }
}
