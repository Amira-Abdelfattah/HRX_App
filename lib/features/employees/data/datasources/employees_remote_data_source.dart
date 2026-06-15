import 'package:injectable/injectable.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../models/add_employee_response_model.dart';

abstract class EmployeesRemoteDataSource {
  Future<AddEmployeeResponseModel> addEmployee({
    required String name,
    required String email,
    required String password,
    required String role,
    required String jobId,
    required String companyName,
  });

  Future<List<AddEmployeeResponseModel>> getEmployees();
}

@Injectable(as: EmployeesRemoteDataSource)
class EmployeesRemoteDataSourceImpl implements EmployeesRemoteDataSource {
  final ApiManager apiManager;

  EmployeesRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<AddEmployeeResponseModel>> getEmployees() async {
    var response = await apiManager.postData(
      endPoint: "/api/getUsers",
      baseUrl: ApiConstants.odooBaseUrl,
      body: {
        "jsonrpc": "2.0",
        "method": "call",
        "params": {},
        "id": DateTime
            .now()
            .millisecondsSinceEpoch
      },
    );

    final data = response.data;

    // Handle case where Odoo returns a direct List instead of JSON-RPC Map
    if (data is List) {
      return data.map((item) {
        if (item is Map<String, dynamic>) {
          return AddEmployeeResponseModel.fromJson(item);
        }
        return AddEmployeeResponseModel();
      }).toList();
    }

    // Standard JSON-RPC handling
    if (data is Map<String, dynamic>) {
      if (data['error'] != null) {
        throw Exception(
            data['error']['message'] ?? "Odoo Backend Error");
      }
      final result = data['result'];
      if (result != null && result is List) {
        return result.map((item) {
          if (item is Map<String, dynamic>) {
            return AddEmployeeResponseModel.fromJson(item);
          }
          return AddEmployeeResponseModel();
        }).toList();
      }
    }

    return [];
  }

  @override
  Future<AddEmployeeResponseModel> addEmployee({
    required String name,
    required String email,
    required String password,
    required String role,
    required String jobId,
    required String companyName,
  }) async {
    // Map UI role to backend role
    String backendRole = 'user';
    String normalizedRole = role.toLowerCase();
    if (normalizedRole.contains('hr') || normalizedRole.contains('admin')) {
      backendRole = 'admin';
    } else if (normalizedRole.contains('manager')) {
      backendRole = 'manager';
    }

    var response = await apiManager.postData(
      endPoint: EndPoints.addUserEndPoint,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {
        "jsonrpc": "2.0",
        "method": "call",
        "params": {
          "name": name.trim(),
          "email": email.trim(),
          "password": password.trim(),
          "create_new_company": false,
          "role": backendRole,
          "job_id": jobId.trim(),
          "company_name": companyName.trim(),
        },
        "id": DateTime
            .now()
            .millisecondsSinceEpoch
      },
    );

    final data = response.data;
    if (data is Map<String, dynamic> && data['error'] != null) {
      throw Exception(
          data['error']['message'] ?? "Failed to add employee");
    }

    final result = data is Map<String, dynamic> ? data['result'] : data;
    if (result == null || result == false ||
        (result is Map && result['status'] == 'error')) {
      throw Exception(result is Map
          ? (result['message'] ?? "Failed to add employee")
          : "Failed to add employee");
    }

    if (result is int) {
      return AddEmployeeResponseModel(
        userId: result,
        status: 'success',
        name: name,
        email: email,
        role: role,
        jobId: jobId,
      );
    }

    if (result == true) {
      return AddEmployeeResponseModel(
        status: 'success',
        name: name,
        email: email,
        role: role,
        jobId: jobId,
      );
    }

    return AddEmployeeResponseModel.fromJson(result as Map<String, dynamic>);
  }
}
