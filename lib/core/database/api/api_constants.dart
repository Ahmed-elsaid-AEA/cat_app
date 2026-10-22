import 'package:envied/envied.dart';

part 'api_constants.g.dart';

@envied
abstract class ApiConstants {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _ApiConstants.baseUrl;
  @EnviedField(varName: 'FACTS_END_POINT')
  static const String factsEndPoint = _ApiConstants.factsEndPoint;
  @EnviedField(varName: 'BREEDS_END_POINT')
  static const String breedsEndPoint = _ApiConstants.breedsEndPoint;

  static const String errors = 'errors';

  static const String connectionTimeout = 'connection timeout';

  static const String sendTimeOut = 'send timeout';

  static const String receiveTimeOut = 'receive timeout';

  static const String badCertificate = 'bad certificate';

  static const String badResponse = 'bad response';

  static const String cancel = 'cancel';

  static const String connectionError = 'connection error';

  static const String unKnownError = 'un known error';
}

// dart run build_runner build
