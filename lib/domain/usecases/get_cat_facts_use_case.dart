import 'package:cat_app/core/type_def/app_type_def.dart';
 import 'package:cat_app/domain/repository/cat_repository.dart';

class GetCatFactsUseCase {
  final CatRepository catRepository;
  const GetCatFactsUseCase({required this.catRepository});
  CatFactsResult call() async {
    return await catRepository.getCatFacts();
  }
}
