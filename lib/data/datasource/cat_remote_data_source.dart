import 'package:cat_app/domain/entities/facts_entity.dart';

abstract class CatRemoteDataSource {
  Future<FactsEntity> getCatFacts();
}

class CatRemoteDataSourceImp implements CatRemoteDataSource {
  @override
  Future<FactsEntity> getCatFacts() {
    throw UnimplementedError();
  }
}
