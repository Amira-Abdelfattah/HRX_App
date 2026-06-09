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
      status: json['status'],
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      companyId: json['company_id'],
      jobId: json['job_id'],
    );
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
