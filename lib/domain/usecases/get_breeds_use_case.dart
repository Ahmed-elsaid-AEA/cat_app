import 'package:cat_app/core/type_def/app_type_def.dart';
 import 'package:cat_app/domain/repository/cat_repository.dart';

class GetBreedsUseCase  {
  final CatRepository catRepository;
  const GetBreedsUseCase({required this.catRepository});
  BreedFactsResult call() async {
    return await catRepository.getCatBreeds();
  }
}
