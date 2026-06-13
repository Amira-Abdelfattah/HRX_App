import 'package:injectable/injectable.dart';

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

@Injectable(as: AuthRemoteDataSource)
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
    // Map UI role to backend role
    String backendRole = 'user';
    String normalizedRole = role.toLowerCase();
    if (normalizedRole.contains('hr') || normalizedRole.contains('admin')) {
      backendRole = 'admin';
    } else if (normalizedRole.contains('manager')) {
      backendRole = 'manager';
    }

    var response = await apiManager.postData(
      endPoint: EndPoints.signUp,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {
        "jsonrpc": "2.0",
        "method": "call",
        "params": {
          "name": fullName.trim(),
          "email": email.trim(),
          "password": password.trim(),
          "role": backendRole,
          "company_name": companyName.trim(),
        },
        "id": DateTime
            .now()
            .millisecondsSinceEpoch
      },
    );

    if (response.data['error'] != null) {
      throw Exception(
          response.data['error']['message'] ?? "Registration Failed");
    }

    final result = response.data['result'];
    if (result == null || result == false) {
      throw Exception("Registration failed: Email might already be in use");
    }

    if (result is Map && result['status'] == 'error') {
      throw Exception(result['message'] ?? "Registration Failed");
    }

    // Handle Odoo returning true on success instead of a record map
    if (result == true) {
      return const RegisterResponseModel(
        message: "Registration successful",
      );
    }

    return RegisterResponseModel.fromJson(
      result is Map ? result as Map<String, dynamic> : {},
    );
  }

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    var response = await apiManager.postData(
      endPoint: EndPoints.login,
      baseUrl: ApiConstants.odooBaseUrl,
      body: {
        "jsonrpc": "2.0",
        "method": "call",
        "params": {
          "login": email.trim(),
          "email": email.trim(),
          "password": password.trim(),
        },
        "id": DateTime
            .now()
            .millisecondsSinceEpoch
      },
    );

    if (response.data['error'] != null) {
      throw Exception(response.data['error']['message'] ?? "Login Failed");
    }

    final result = response.data['result'];

    if (result == null || result == false) {
      throw Exception("Access Denied: Invalid email or password");
    }

    if (result is Map && result['status'] == 'error') {
      throw Exception(result['message'] ?? "Access Denied");
    }

    return LoginResponseModel.fromJson(
      result as Map<String, dynamic>,
    );
  }
}
