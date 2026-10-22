import 'package:cat_app/domain/entities/breeds_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'breeds_model.g.dart';
@JsonSerializable()
class BreedsModel extends BreedsEntity {
  const BreedsModel({
    required super.breed,
    required super.country,
    required super.origin,
    required super.coat,
    required super.pattern,
  });
  factory BreedsModel.fromJson(Map<String, dynamic> json) =>
      _$BreedsModelFromJson(json);
  Map<String, dynamic> toJson() => _$BreedsModelToJson(this);
}