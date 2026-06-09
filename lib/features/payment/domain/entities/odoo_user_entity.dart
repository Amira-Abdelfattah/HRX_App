class OdooUserEntity {
  final String status;
  final int userId;
  final String name;
  final String email;
  final String role;
  final int companyId;

  OdooUserEntity({
    required this.status,
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    required this.companyId,
  });
}
