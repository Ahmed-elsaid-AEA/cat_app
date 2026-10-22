import 'package:hive/hive.dart';

part 'breeds_entity.g.dart';

@HiveType(typeId: 0)
class BreedsEntity {
  @HiveField(0)
  final String breed;
  @HiveField(1)
  final String country;
  @HiveField(2)
  final String origin;
  @HiveField(3)
  final String coat;
  @HiveField(4)
  final String pattern;

  const BreedsEntity({
    required this.breed,
    required this.country,
    required this.origin,
    required this.coat,
    required this.pattern,
  });
}

