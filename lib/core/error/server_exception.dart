import 'package:json_annotation/json_annotation.dart';

part 'server_exception.g.dart';

@JsonSerializable()
class ServerException implements Exception {
  final String message;
  final int statusCode;
  final Map<String, dynamic> data;
  const ServerException({
    required this.message,
    required this.statusCode,
    required this.data,
  });
  factory ServerException.fromJson(Map<String, dynamic> json) =>
      _$ServerExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$ServerExceptionToJson(this);
  @override
  String toString() =>
      'ServerException(message: $message, statusCode: $statusCode, data: $data)';
}
