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
}

@Injectable(as: EmployeesRemoteDataSource)
class EmployeesRemoteDataSourceImpl implements EmployeesRemoteDataSource {
  final ApiManager apiManager;

  EmployeesRemoteDataSourceImpl(this.apiManager);

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
        "name": name,
        "email": email,
        "password": password,
        "create_new_company": false,
        "role": role,
        "job_id": jobId,
      },
    );
    return AddEmployeeResponseModel.fromJson(response.data['result']);
  }
}
