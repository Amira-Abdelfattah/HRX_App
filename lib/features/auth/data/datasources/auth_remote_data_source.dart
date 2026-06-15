import 'dart:convert';

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

    if (normalizedRole.contains('hr') ||
        normalizedRole.contains('admin') ||
        normalizedRole.contains('manager')) {
      backendRole = 'admin';
    }

    var response = await apiManager.postData(
      endPoint: EndPoints.signUp,
      baseUrl: ApiConstants.baseUrl,
      body: {
        "fullName": fullName.trim(),
        "email": email.trim(),
        "password": password.trim(),
        "role": backendRole,
        "company_name": companyName.trim(),
      },
    );

    dynamic responseData = response.data;
    if (responseData is String) {
      try {
        responseData = jsonDecode(responseData);
      } catch (_) {
        // Handle raw string success response
        if (responseData.toLowerCase().contains('success') ||
            responseData.toLowerCase().contains('sucess')) {
          return RegisterResponseModel(message: responseData);
        }
        throw Exception(responseData);
      }
    }

    if (responseData is! Map) {
      throw Exception("Unexpected registration response format");
    }

    final responseMap = Map<String, dynamic>.from(responseData);
    if (responseMap['error'] != null) {
      final errorData = responseMap['error'];
      String errorMessage = "Registration Failed";

      if (errorData is Map && errorData['message'] is String) {
        errorMessage = errorData['message'] as String;
      } else if (errorData is String) {
        errorMessage = errorData;
      }

      throw Exception(errorMessage);
    }

    final result = responseMap['result'];
    final message = responseMap['message'];

    // Check for success message in result or message field (handling typos)
    bool isSuccess(dynamic val) {
      if (val is! String) return false;
      final lower = val.toLowerCase();
      return lower.contains('success') || lower.contains('sucess');
    }

    if (isSuccess(result)) {
      return RegisterResponseModel(message: result as String);
    }

    if (isSuccess(message)) {
      return RegisterResponseModel(message: message as String);
    }

    if (result == null || result == false) {
      if (message is String) {
        throw Exception(message);
      }
      if (responseMap['status'] is String &&
          responseMap['status'] != 'success') {
        throw Exception(responseMap['status'] as String);
      }
      throw Exception(
        "Registration failed: unexpected response format: ${jsonEncode(
            responseMap)}",
      );
    }

    if (result is String) {
      throw Exception(result);
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
      baseUrl: ApiConstants.baseUrl,
      body: {
        "email": email.trim(),
        "password": password.trim(),
      },
    );

    dynamic responseData = response.data;
    if (responseData is String) {
      try {
        responseData = jsonDecode(responseData);
      } catch (_) {
        // Handle raw string success response
        if (responseData.toLowerCase().contains('success') ||
            responseData.toLowerCase().contains('sucess')) {
          return const LoginResponseModel(status: 'success');
        }
        throw Exception(responseData);
      }
    }

    if (responseData is! Map) {
      throw Exception("Unexpected login response format");
    }

    final responseMap = Map<String, dynamic>.from(responseData);
    if (responseMap['error'] != null) {
      final errorData = responseMap['error'];
      String errorMessage = "Login Failed";

      if (errorData is Map && errorData['message'] is String) {
        errorMessage = errorData['message'] as String;
      } else if (errorData is String) {
        errorMessage = errorData;
      }

      throw Exception(errorMessage);
    }

    final result = responseMap['result'];
    final message = responseMap['message'];

    // Check for success message in result or message field (handling typos)
    bool isSuccess(dynamic val) {
      if (val is! String) return false;
      final lower = val.toLowerCase();
      return lower.contains('success') || lower.contains('sucess');
    }

    if (isSuccess(result)) {
      return const LoginResponseModel(status: 'success');
    }

    if (isSuccess(message)) {
      return const LoginResponseModel(status: 'success');
    }

    if (result == null || result == false) {
      if (message is String) {
        throw Exception(message);
      }
      throw Exception("Access Denied: Invalid email or password");
    }

    if (result is String) {
      throw Exception(result);
    }

    if (result is Map && result['status'] == 'error') {
      throw Exception(result['message'] ?? "Access Denied");
    }

    if (result is! Map<String, dynamic>) {
      throw Exception("Unexpected login response format");
    }

    return LoginResponseModel.fromJson(result);

  }
}
