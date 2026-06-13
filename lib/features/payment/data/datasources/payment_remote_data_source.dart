import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../models/odoo_user_response.dart';

abstract class PaymentRemoteDataSource {
  Future<OdooUserResponse> addOdooUser({
    required String name,
    required String email,
    required String password,
    required String role,
    required String companyName,
  });
}

@LazySingleton(as: PaymentRemoteDataSource)
class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final ApiManager apiManager;

  PaymentRemoteDataSourceImpl(this.apiManager);

  @override
  Future<OdooUserResponse> addOdooUser({
    required String name,
    required String email,
    required String password,
    required String role,
    required String companyName,
  }) async {
    final Map<String, dynamic> requestBody = {
      "jsonrpc": "2.0",
      "method": "call",
      "params": {
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "create_new_company": true,
        "company_name": companyName,
      },
      "id": 1
    };

    print("DEBUG: Sending to Odoo: $requestBody");

    try {
      final response = await apiManager.postData(
        baseUrl: ApiConstants.odooBaseUrl,
        endPoint: EndPoints.addUserEndPoint,
        body: requestBody,
      ).timeout(const Duration(seconds: 20));

      print("DEBUG: Odoo Response Data: ${response.data}");

      if (response.data == null) {
        throw Exception("Server returned empty response");
      }

      if (response.data['error'] != null) {
        String errorMsg = response.data['error']['message'] ??
            "Odoo Internal Error";
        if (response.data['error']['data'] != null &&
            response.data['error']['data']['message'] != null) {
          errorMsg = response.data['error']['data']['message'];
        }
        throw Exception(errorMsg);
      }

      return OdooUserResponse.fromJson(response.data);
    } catch (e) {
      print("DEBUG: Error in addOdooUser: $e");
      if (e is TimeoutException) {
        throw Exception("Network timeout, please try again");
      }
      rethrow;
    }
  }
}
