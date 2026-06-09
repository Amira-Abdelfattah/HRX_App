import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/RegisterResponseEntity.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
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

  @override
  Future<Either<Failures, LoginResponseEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.login(
          email: email, password: password);
      return Right(result);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
