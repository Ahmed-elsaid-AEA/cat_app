// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactsModel _$FactsModelFromJson(Map<String, dynamic> json) => FactsModel(
  fact: json['fact'] as String,
  length: (json['length'] as num).toInt(),
);

Map<String, dynamic> _$FactsModelToJson(FactsModel instance) =>
    <String, dynamic>{'fact': instance.fact, 'length': instance.length};
