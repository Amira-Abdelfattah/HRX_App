import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/add_employee_response_entity.dart';
import '../../domain/repositories/employees_repository.dart';
import '../datasources/employees_remote_data_source.dart';

@Injectable(as: EmployeesRepository)
class EmployeesRepositoryImpl implements EmployeesRepository {
  final EmployeesRemoteDataSource remoteDataSource;

  EmployeesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, AddEmployeeResponseEntity>> addEmployee({
    required String name,
    required String email,
    required String password,
    required String role,
    required String jobId,
  }) async {
    try {
      final result = await remoteDataSource.addEmployee(
        name: name,
        email: email,
        password: password,
        role: role,
        jobId: jobId,
      );

      if (result.status == 'error' || result.status == 'failed') {
        return Left(ServerError(
            errorMessage: 'Failed to add employee: ${result.name ??
                "Backend error"}'));
      }

      return Right(result);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<
      Either<Failures, List<AddEmployeeResponseEntity>>> getEmployees() async {
    try {
      final result = await remoteDataSource.getEmployees();
      return Right(result);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
