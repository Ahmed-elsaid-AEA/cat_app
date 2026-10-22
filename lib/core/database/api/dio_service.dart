import 'package:cat_app/core/database/api/api_constants.dart';
import 'package:cat_app/core/database/api/api_conumer.dart';
import 'package:cat_app/core/error/server_exception.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService extends ApiConumer {
  final Dio _dio;
  DioService(this._dio) {
    _initDio();
  }

  void _initDio() {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        enabled: true,
        request: true,
        maxWidth: 90,
      ),
    ]);
  }

  @override
  Future<dynamic> delete({required String path}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> get({required String path}) async {
    Response<dynamic> response = await _dio.get(path);
    try {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        //success
        return response.data;
      } else {
        //failure
        throw ServerException(
          message: '',
          statusCode: response.statusCode!,
          data: response.data,
        );
      }
    } catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<ServerException> _handleDioException(Object e) async {
    if (e is DioException) {
      var data = await e.response?.data;
      if (data is! Map<String, dynamic>) {
        data = {ApiConstants.errors: data};
      }
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return throw ServerException(
            data: data,
            statusCode: e.response?.statusCode ?? 408,
            message: ApiConstants.connectionTimeout,
          );
        case DioExceptionType.sendTimeout:
          return throw ServerException(
            data: data,
            statusCode: e.response?.statusCode ?? 408,
            message: ApiConstants.sendTimeOut,
          );
        case DioExceptionType.receiveTimeout:
          return throw ServerException(
            data: data,
            statusCode: e.response?.statusCode ?? 408,
            message: ApiConstants.receiveTimeOut,
          );
        case DioExceptionType.badCertificate:
          return throw ServerException(
            data: data,
            statusCode: e.response?.statusCode ?? 408,
            message: ApiConstants.badCertificate,
          );
        case DioExceptionType.badResponse:
          return throw ServerException(
            data: data,
            statusCode: e.response?.statusCode ?? 408,
            message: ApiConstants.badResponse,
          );
        case DioExceptionType.cancel:
          return throw ServerException(
            data: data,
            statusCode: e.response?.statusCode ?? 408,
            message: ApiConstants.cancel,
          );
        case DioExceptionType.connectionError:
          return throw ServerException(
            data: data,
            statusCode: e.response?.statusCode ?? 408,
            message: ApiConstants.connectionError,
          );
        case DioExceptionType.unknown:
          return throw ServerException(
            data: data,
            statusCode: e.response?.statusCode ?? 408,
            message: ApiConstants.unKnownError,
          );
        case DioExceptionType.transformTimeout:
          return throw ServerException(
            data: data,
            statusCode: e.response?.statusCode ?? 408,
            message: ApiConstants.unKnownError,
          );
      }
    } else {
      return throw ServerException(
        data: {ApiConstants.errors: e.toString()},
        statusCode: 408,
        message: ApiConstants.unKnownError,
      );
    }
  }

  @override
  Future<dynamic> post({required String path, required body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<dynamic> put({required String path, required body}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
