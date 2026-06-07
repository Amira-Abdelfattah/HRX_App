import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/RegisterResponseEntity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, RegisterResponseEntity>> register({
    required String fullName,
    required String email,
    required String password,
    required String role,
    required String companyName,
  }) async {
    try {
      final result = await remoteDataSource.register(
        fullName: fullName,
        email: email,
        password: password,
        role: role,
        companyName: companyName,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
