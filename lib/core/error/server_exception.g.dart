// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerException _$ServerExceptionFromJson(Map<String, dynamic> json) =>
    ServerException(
      message: json['message'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ServerExceptionToJson(ServerException instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };
