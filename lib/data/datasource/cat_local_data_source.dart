import 'package:cat_app/domain/entities/facts_entity.dart';

abstract class CatLocalDataSource {
  Future<FactsEntity> getCatFacts();
}

class CatLocalDataSourceImp implements CatLocalDataSource {
  @override
  Future<FactsEntity> getCatFacts() {
    throw UnimplementedError();
  }
}
