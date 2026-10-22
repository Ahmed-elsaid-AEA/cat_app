import 'package:cat_app/data/datasource/cat_local_data_source.dart';
import 'package:cat_app/data/datasource/cat_remote_data_source.dart';
import 'package:cat_app/domain/entities/facts_entity.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';

class CatRepositoryImp implements CatRepository {
  final CatRemoteDataSource catRemoteDataSource;
  final CatLocalDataSource catLocalDataSource;

  const CatRepositoryImp({
    required this.catRemoteDataSource,
    required this.catLocalDataSource,
  });
  @override
  Future<FactsEntity> getCatFacts() {
    // TODO: implement getCatFacts
    throw UnimplementedError();
  }
}
