import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/RegisterResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register({
    required String fullName,
    required String email,
    required String password,
    required String role,
    required String companyName,
  });
}
