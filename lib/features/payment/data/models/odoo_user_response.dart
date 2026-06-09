class OdooUserResponse {
  String? jsonrpc;
  int? id;
  OdooResult? result;

  OdooUserResponse({this.jsonrpc, this.id, this.result});

  OdooUserResponse.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result = json['result'] != null ? OdooResult.fromJson(json['result']) : null;
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
}
