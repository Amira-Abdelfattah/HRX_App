import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../models/login_response_model.dart';
import '../models/register_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponseModel> register({
    required String fullName,
    required String email,
    required String password,
    required String role,
    required String companyName,
  });

  Future<LoginResponseModel> login({
    required String email,
    required String password,
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

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    var response = await apiManager.postData(
      endPoint: EndPoints.login,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {"email": email, "password": password},
    );
    return LoginResponseModel.fromJson(
      response.data['result'] as Map<String, dynamic>,
    );
  }
}
