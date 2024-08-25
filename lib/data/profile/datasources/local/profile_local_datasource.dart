import 'package:financial_app/data/profile/entity/profile_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ProfileDao {
  @Query('SELECT * FROM ProfileEntity WHERE id = :id')
  Future<ProfileEntity?> findPersonById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProfile(ProfileEntity profile);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateProfile(ProfileEntity profile);
}
