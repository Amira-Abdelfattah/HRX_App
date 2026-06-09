import '../../domain/entities/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel({
    super.status,
    super.userId,
    super.name,
    super.email,
    super.companyId,
    super.companyName,
    super.role,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] as String?,
      userId: json['user_id'] is int
          ? json['user_id'] as int
          : int.tryParse('${json['user_id']}'),
      name: json['name'] as String?,
      email: json['email'] as String?,
      companyId: json['company_id'] is int
          ? json['company_id'] as int
          : int.tryParse('${json['company_id']}'),
      companyName: json['company_name'] as String?,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'user_id': userId,
      'name': name,
      'email': email,
      'company_id': companyId,
      'company_name': companyName,
      'role': role,
    };
  }
}
