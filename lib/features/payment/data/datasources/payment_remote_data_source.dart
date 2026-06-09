import '../../../../core/api/api_manager.dart';
import '../../../../core/api/api_constants.dart';
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

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  @override
  Future<OdooUserResponse> addOdooUser({
    required String name,
    required String email,
    required String password,
    required String role,
    required String companyName,
  }) async {
    final response = await ApiManager.instance.postData(
      baseUrl: ApiConstants.odooBaseUrl,
      endPoint: EndPoints.addUserEndPoint,
      body: {
        "jsonrpc": "2.0",
        "method": "call",
        "params": {
          "name": name,
          "email": email,
          "password": password,
          "role": role,
          "create_new_company": true,
          "companyName": companyName
        },
        "id": 1
      },
    );
    return OdooUserResponse.fromJson(response.data);
  }
}
