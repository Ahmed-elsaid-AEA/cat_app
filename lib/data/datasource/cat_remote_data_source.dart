import 'package:cat_app/core/database/api/api_constants.dart';
import 'package:cat_app/core/database/api/dio_service.dart';
import 'package:cat_app/core/error/server_exception.dart';
import 'package:cat_app/core/type_def/app_type_def.dart';
import 'package:cat_app/data/model/breeds_model.dart';
import 'package:cat_app/data/model/facts_model.dart';
import 'package:dartz/dartz.dart';

abstract class CatRemoteDataSource {
  CatFactsResult getCatFacts();
  BreedFactsResult getCatBreeds();
}

class CatRemoteDataSourceImp implements CatRemoteDataSource {
  final DioService dioService;
  const CatRemoteDataSourceImp(this.dioService);
  @override
  CatFactsResult getCatFacts() async {
    try {
      var res = await dioService.get(path: ApiConstants.factsEndPoint);
      return Right(FactsModel.fromJson(res as Map<String, dynamic>));
    } on ServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  BreedFactsResult getCatBreeds() async {
    try {
      var res = await dioService.get(path: ApiConstants.breedsEndPoint);
      var data = List.from(res["data"]);
      return Right(data.map((e) => BreedsModel.fromJson(e)).toList());
    } on ServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
