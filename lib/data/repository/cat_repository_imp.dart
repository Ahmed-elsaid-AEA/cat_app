import 'package:cat_app/core/type_def/app_type_def.dart';
import 'package:cat_app/data/datasource/cat_local_data_source.dart';
import 'package:cat_app/data/datasource/cat_remote_data_source.dart';
import 'package:cat_app/domain/entities/breeds_entity.dart';
import 'package:cat_app/domain/entities/facts_entity.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class CatRepositoryImp implements CatRepository {
  final CatRemoteDataSource catRemoteDataSource;
  final CatLocalDataSource catLocalDataSource;

  const CatRepositoryImp({
    required this.catRemoteDataSource,
    required this.catLocalDataSource,
  });

  @override
  CatFactsResult getCatFacts() async {
    FactsEntity? fact;
    try {
      var data = await catRemoteDataSource.getCatFacts();
      await data.fold(
        (String f) async {
          //cash
          fact = await _getFacts();
        },
        (FactsEntity r) async {
          //store data in cash (local)
          var box = await Hive.openBox('facts');
          await box.put('fact', r.fact);
          await box.put('length', r.length);

          fact = r;
        },
      );
      print(fact?.length);
    } catch (e) {
      fact = await _getFacts();
    }

    if (fact == null) {
      return Left("Check Internet Connection");
    }
    return Right(fact!);
  }

  Future<FactsEntity?> _getFacts() async {
    var box = await Hive.openBox('facts');
    String? fact = box.get('fact');
    int? length = box.get('length');
    return fact == null || length == null
        ? null
        : FactsEntity(fact: fact, length: length);
  }

  @override
  BreedFactsResult getCatBreeds() async {
    List<BreedsEntity> list = [];
    try {
      var data = await catRemoteDataSource.getCatBreeds();
      await data.fold(
        (String f) async {
          print(f);
          //cash
          list = await _getBreeds() ?? [];
        },
        (List<BreedsEntity> r) async {
          //store data in cash (local)
          var box = await Hive.openBox('breeds');
          await box.put('breeds', r);
          list = r;
                    print(r);

        },
      );
    } catch (e) {
      list = await _getBreeds() ?? [];
    }

    if (list.isEmpty) {
      return Left("Check Internet Connection");
    }
    return Right(list);
  }

  Future<List<BreedsEntity>?> _getBreeds() async {
    var box = await Hive.openBox('breeds');
    final rawList = box.get('breeds');
    if (rawList is List) {
      return rawList.cast<BreedsEntity>();
    }
    return null;
  }
}

