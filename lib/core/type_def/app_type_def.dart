import 'package:cat_app/domain/entities/facts_entity.dart';
import 'package:dartz/dartz.dart';

typedef CatFactsResult = Future<Either<String, FactsEntity>>;
