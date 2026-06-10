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
  });

  Future<List<AddEmployeeResponseModel>> getEmployees();
}

@Injectable(as: EmployeesRemoteDataSource)
class EmployeesRemoteDataSourceImpl implements EmployeesRemoteDataSource {
  final ApiManager apiManager;

  EmployeesRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<AddEmployeeResponseModel>> getEmployees() async {
    var response = await apiManager.getData(
      endPoint: "/api/getUsers",
      baseUrl: ApiConstants.odooBaseUrl,
    );

    if (response.data['error'] != null) {
      throw Exception(
          response.data['error']['message'] ?? "Odoo Backend Error");
    }

    if (response.data['result'] != null && response.data['result'] is List) {
      List list = response.data['result'];
      return list
          .map((item) => AddEmployeeResponseModel.fromJson(item))
          .toList();
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
  }) async {
    var response = await apiManager.postData(
      endPoint: EndPoints.addUserEndPoint,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {
        "params": {
          "name": name,
          "email": email,
          "password": password,
          "create_new_company": false,
          "role": role,
          "job_id": jobId,
        }
      },
    );

    if (response.data['error'] != null) {
      throw Exception(
          response.data['error']['message'] ?? "Failed to add employee");
    }

    final result = response.data['result'];
    if (result == null) {
      throw Exception("No data returned from server");
    }

    return AddEmployeeResponseModel.fromJson(result);
  }
}
