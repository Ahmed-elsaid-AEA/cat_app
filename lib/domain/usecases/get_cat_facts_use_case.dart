import 'package:cat_app/domain/entities/facts_entity.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';

class GetCatFactsUseCase {
  final CatRepository catRepository;
  const GetCatFactsUseCase({required this.catRepository});
  Future<FactsEntity> call() async {
    return await catRepository.getCatFacts();
  }
}
