import 'package:cat_app/core/database/api/dio_service.dart';
import 'package:cat_app/data/datasource/cat_local_data_source.dart';
import 'package:cat_app/data/datasource/cat_remote_data_source.dart';
import 'package:cat_app/data/repository/cat_repository_imp.dart';
import 'package:cat_app/domain/usecases/get_breeds_use_case.dart';
import 'package:cat_app/domain/usecases/get_cat_facts_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioService>(() => DioService(getIt.dio));
  getIt.registerLazySingleton<CatLocalDataSourceImp>(
    () => CatLocalDataSourceImp(),
  );
  getIt.registerLazySingleton<CatRemoteDataSource>(
    () => CatRemoteDataSourceImp(getIt.dioService),
  );
  getIt.registerLazySingleton<CatRepositoryImp>(
    () => CatRepositoryImp(
      catRemoteDataSource: getIt.catRemoteDataSource,
      catLocalDataSource: getIt.catLocalDataSourceImp,
    ),
  );
  getIt.registerLazySingleton<GetCatFactsUseCase>(
    () => GetCatFactsUseCase(catRepository: getIt.catRepositoryImp),
  );
  getIt.registerLazySingleton<GetBreedsUseCase>(
    () => GetBreedsUseCase(catRepository: getIt.catRepositoryImp),
  );
}

extension GetitExtensions on GetIt {
  Dio get dio => this<Dio>();
  DioService get dioService => this<DioService>();
  CatLocalDataSourceImp get catLocalDataSourceImp =>
      this<CatLocalDataSourceImp>();
  CatRemoteDataSource get catRemoteDataSource => this<CatRemoteDataSource>();
  CatRepositoryImp get catRepositoryImp => this<CatRepositoryImp>();
  GetCatFactsUseCase get getCatFactsUseCase => this<GetCatFactsUseCase>();
  GetBreedsUseCase get getBreedsUseCase => this<GetBreedsUseCase>();
}
