import 'package:financial_app/common/di/di_initialize.dart';
import 'package:financial_app/data/profile/datasources/local/app_database.dart';
import 'package:financial_app/data/profile/datasources/local/profile_local_datasource.dart';
import 'package:financial_app/data/profile/datasources/local/profile_repository.dart';

class ProfileInjection {
  ProfileInjection() {
    _local();
  }

  _local() {
    sl.registerSingletonAsync<AppDatabase>(() async => $FloorAppDatabase.databaseBuilder('app_database.db').build());

    sl.registerSingletonWithDependencies<ProfileDao>(() => sl<AppDatabase>().personDao, dependsOn: [AppDatabase]);

    sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        appDatabase: sl(),
      ),
    );
  }
}
