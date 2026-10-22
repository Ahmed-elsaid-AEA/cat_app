import 'package:cat_app/app/my_app.dart';
import 'package:cat_app/core/app_get_it.dart';
import 'package:cat_app/domain/entities/breeds_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

//! 1 - go to domain (beacouse most stable layer ) in layer entities and make enties ( info that i intersed in like name age)
//! 2 - in domain in layer repostiory => contract (abstract class)
//! 3 - in domain in layer usecases =>  bridge presentation that talk to
//! 4 - in data in layer model => model extends entity
//! 5  - in data in layer datasource => implementions
//! 6  - in data in layer repository => will use repository in data => implementation
//https://catfact.ninja/fact
// https://catfact.ninja/breeds
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BreedsEntityAdapter());

  await setUpGetIt();
  runApp(const MyApp());
}

