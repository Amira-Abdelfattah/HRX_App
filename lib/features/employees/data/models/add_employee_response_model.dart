import '../../domain/entities/add_employee_response_entity.dart';

class AddEmployeeResponseModel extends AddEmployeeResponseEntity {
  AddEmployeeResponseModel({
    super.status,
    super.userId,
    super.name,
    super.email,
    super.role,
    super.companyId,
    super.jobId,
  });

  factory AddEmployeeResponseModel.fromJson(Map<String, dynamic> json) {
    return AddEmployeeResponseModel(
      status: _parseString(json['status']),
      userId: _parseInt(json['user_id']),
      name: _parseString(json['name']),
      email: _parseString(json['email']),
      role: _parseString(json['role']),
      companyId: _parseInt(json['company_id']),
      jobId: json['job_id'] == false ? null : json['job_id'],
    );
  }

  static String? _parseString(dynamic value) {
    if (value == null || value == false) return null;
    if (value is List && value.length > 1) return value[1].toString();
    return value.toString();
  }

  static int? _parseInt(dynamic value) {
    if (value == null || value == false) return null;
    if (value is int) return value;
    if (value is List && value.isNotEmpty) {
      return value[0] is int ? value[0] : int.tryParse(value[0].toString());
    }
    if (value is String) return int.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'user_id': userId,
      'name': name,
      'email': email,
      'role': role,
      'company_id': companyId,
      'job_id': jobId,
    };
  }
}
