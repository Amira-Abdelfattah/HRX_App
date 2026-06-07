import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_constants.dart';

@singleton
class ApiManager {
  Dio dio = Dio();

  Future<Response> postData({required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Options? options,
    Map<String, dynamic>? headers}) {
    return dio.post(ApiConstants.baseUrl + endPoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers, validateStatus: (status) => true));
  }

}