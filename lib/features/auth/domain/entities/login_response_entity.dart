import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final String? status;
  final int? userId;
  final String? name;
  final String? email;
  final int? companyId;
  final String? companyName;
  final String? role;

  const LoginResponseEntity({
    this.status,
    this.userId,
    this.name,
    this.email,
    this.companyId,
    this.companyName,
    this.role,
  });

  @override
  List<Object?> get props => [
    status,
    userId,
    name,
    email,
    companyId,
    companyName,
    role,
  ];
}
