import 'package:cat_app/domain/entities/facts_entity.dart';

abstract class CatRepository {
   Future<FactsEntity> getCatFacts();
 
}