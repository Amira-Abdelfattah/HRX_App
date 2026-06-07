import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/RegisterResponseEntity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failures, RegisterResponseEntity>> call({
    required String fullName,
    required String email,
    required String password,
    required String role,
    required String companyName,
  }) {
    return repository.register(
      fullName: fullName,
      email: email,
      password: password,
      role: role,
      companyName: companyName,
    );
  }
}
