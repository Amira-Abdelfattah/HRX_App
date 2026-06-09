import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/RegisterResponseEntity.dart';
import '../entities/login_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register({
    required String fullName,
    required String email,
    required String password,
    required String role,
    required String companyName,
  });

  Future<Either<Failures, LoginResponseEntity>> login({
    required String email,
    required String password,
  });
}
