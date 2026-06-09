import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../models/register_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponseModel> register({
    required String fullName,
    required String email,
    required String password,
    required String role,
    required String companyName,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManager apiManager;

  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<RegisterResponseModel> register({
    required String fullName,
    required String email,
    required String password,
    required String role,
    required String companyName,
  }) async {
    var response = await apiManager.postData(
      endPoint: EndPoints.signUp,
      body: {
        "fullName": fullName,
        "email": email,
        "password": password,
        "role": role,
        "CompanyName": companyName,
      },
    );
    return RegisterResponseModel.fromJson(response.data);
  }
}
