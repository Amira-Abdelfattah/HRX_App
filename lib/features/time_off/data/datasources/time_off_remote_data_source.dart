import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../models/time_off_request_model.dart';
import '../models/time_off_type_model.dart';

abstract class TimeOffRemoteDataSource {
  Future<List<TimeOffTypeModel>> getTimeOffTypes();

  Future<List<TimeOffRequestModel>> getMyTimeOffRequests();

  Future<bool> requestTimeOff({
    required int typeId,
    required String startDate,
    required String endDate,
    required String reason,
  });
}

@Injectable(as: TimeOffRemoteDataSource)
class TimeOffRemoteDataSourceImpl implements TimeOffRemoteDataSource {
  final ApiManager apiManager;

  TimeOffRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<TimeOffTypeModel>> getTimeOffTypes() async {
    var response = await apiManager.postData(
      endPoint: EndPoints.getTimeOffTypes,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {},
    );

    Map<String, dynamic> responseData;
    if (response.data is String) {
      responseData = jsonDecode(response.data);
    } else if (response.data is Map) {
      responseData = response.data as Map<String, dynamic>;
    } else {
      throw Exception(
        'Unexpected response format: ${response.data.runtimeType}',
      );
    }

    return TimeOffTypesResponse.fromJson(responseData).data;
  }

  @override
  Future<bool> requestTimeOff({
    required int typeId,
    required String startDate,
    required String endDate,
    required String reason,
  }) async {
    var response = await apiManager.postData(
      endPoint: EndPoints.requestTimeOff,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {
        "holiday_status_id": typeId,
        "date_from": startDate,
        "date_to": endDate,
        "name": reason,
      },
    );
    return response.statusCode == 200;
  }

  @override
  Future<List<TimeOffRequestModel>> getMyTimeOffRequests() async {
    var response = await apiManager.postData(
      endPoint: EndPoints.getMyLeaveRequests,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {},
    );

    Map<String, dynamic> responseData;

    if (response.data is String) {
      responseData = jsonDecode(response.data);
    } else if (response.data is Map) {
      responseData = response.data as Map<String, dynamic>;
    } else {
      throw Exception(
        'Unexpected response format: ${response.data.runtimeType}',
      );
    }

    return TimeOffRequestsResponse.fromJson(responseData).data;
  }
}
