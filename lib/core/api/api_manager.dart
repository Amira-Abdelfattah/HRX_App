import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_constants.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData({
    required String endPoint,
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      (baseUrl ?? ApiConstants.baseUrl) + endPoint,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> postData({
    required String endPoint,
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
    Object? body,
  }) {
    return dio.post(
      (baseUrl ?? ApiConstants.baseUrl) + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> deleteData({
    required String endPoint,
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? body,
  }) {
    return dio.delete(
      (baseUrl ?? ApiConstants.baseUrl) + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> updateData({
    required String endPoint,
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? body,
  }) {
    return dio.put(
      (baseUrl ?? ApiConstants.baseUrl) + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }
}