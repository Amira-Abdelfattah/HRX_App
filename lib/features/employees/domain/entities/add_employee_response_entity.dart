class AddEmployeeResponseEntity {
  final String? status;
  final int? userId;
  final String? name;
  final String? email;
  final String? role;
  final int? companyId;
  final dynamic jobId;

  AddEmployeeResponseEntity({
    this.status,
    this.userId,
    this.name,
    this.email,
    this.role,
    this.companyId,
    this.jobId,
  });
}
