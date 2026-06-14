import 'package:injectable/injectable.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../models/attendance_response_model.dart';

abstract class AttendanceRemoteDataSource {
  Future<AttendanceResponseModel> checkIn(int employeeId);

  Future<AttendanceResponseModel> checkOut(int employeeId);
}

@Injectable(as: AttendanceRemoteDataSource)
class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final ApiManager apiManager;

  AttendanceRemoteDataSourceImpl(this.apiManager);

  @override
  Future<AttendanceResponseModel> checkIn(int employeeId) async {
    final response = await apiManager.postData(
      endPoint: EndPoints.checkIn,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {
        "jsonrpc": "2.0",
        "method": "call",
        "params": {"employee_id": employeeId},
        "id": DateTime.now().millisecondsSinceEpoch,
      },
    );

    if (response.data['error'] != null) {
      throw Exception(response.data['error']['message'] ?? "Check-in failed");
    }

    return AttendanceResponseModel.fromJson(response.data['result']);
  }

  @override
  Future<AttendanceResponseModel> checkOut(int employeeId) async {
    final response = await apiManager.postData(
      endPoint: EndPoints.checkOut,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {
        "jsonrpc": "2.0",
        "method": "call",
        "params": {"employee_id": employeeId},
        "id": DateTime.now().millisecondsSinceEpoch,
      },
    );

    if (response.data['error'] != null) {
      throw Exception(response.data['error']['message'] ?? "Check-out failed");
    }

    return AttendanceResponseModel.fromJson(response.data['result']);
  }
}
