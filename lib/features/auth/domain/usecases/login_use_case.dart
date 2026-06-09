import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/login_response_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failures, LoginResponseEntity>> call({
    required String email,
    required String password,
  }) async {
    return repository.login(email: email, password: password);
  }
}
