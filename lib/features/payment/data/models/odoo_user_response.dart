import '../../domain/entities/odoo_user_entity.dart';

class OdooUserResponse {
  String? jsonrpc;
  int? id;
  OdooResult? result;
  OdooError? error;

  OdooUserResponse({this.jsonrpc, this.id, this.result, this.error});

  OdooUserResponse.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result = json['result'] != null ? OdooResult.fromJson(json['result']) : null;
    error = json['error'] != null ? OdooError.fromJson(json['error']) : null;
  }
}

class OdooError {
  String? message;
  dynamic data;

  OdooError({this.message, this.data});

  OdooError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }
}

class OdooResult {
  String? status;
  int? userId;
  String? name;
  String? email;
  String? role;
  int? companyId;
  dynamic jobId;

  OdooResult({this.status, this.userId, this.name, this.email, this.role, this.companyId, this.jobId});

  OdooResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    companyId = json['company_id'];
    jobId = json['job_id'];
  }

  OdooUserEntity toEntity() {
    return OdooUserEntity(
      status: status ?? "",
      userId: userId ?? 0,
      name: name ?? "",
      email: email ?? "",
      role: role ?? "",
      companyId: companyId ?? 0,
    );
  }
}
