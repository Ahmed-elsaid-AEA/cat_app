import 'package:cat_app/domain/entities/facts_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facts_model.g.dart';

@JsonSerializable()
class FactsModel extends FactsEntity {
  const FactsModel({required super.fact, required super.length});

  factory FactsModel.fromJson(Map<String, dynamic> json) =>
      _$FactsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FactsModelToJson(this);
}
