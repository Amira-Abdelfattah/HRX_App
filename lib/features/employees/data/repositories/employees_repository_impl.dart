import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/add_employee_response_entity.dart';
import '../../domain/repositories/employees_repository.dart';
import '../datasources/employees_local_data_source.dart';
import '../datasources/employees_remote_data_source.dart';

@Injectable(as: EmployeesRepository)
class EmployeesRepositoryImpl implements EmployeesRepository {
  final EmployeesRemoteDataSource remoteDataSource;
  final EmployeesLocalDataSource localDataSource;

  EmployeesRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failures, AddEmployeeResponseEntity>> addEmployee({
    required String name,
    required String email,
    required String password,
    required String role,
    required String jobId,
    required String companyName,
  }) async {
    try {
      final result = await remoteDataSource.addEmployee(
        name: name,
        email: email,
        password: password,
        role: role,
        jobId: jobId,
        companyName: companyName,
      );

      if (result.status == 'error' || result.status == 'failed') {
        return Left(ServerError(
            errorMessage: 'Failed to add employee: ${result.name ??
                "Backend error"}'));
      }

      await localDataSource.cacheEmployee(result);

      return Right(result);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<
      Either<Failures, List<AddEmployeeResponseEntity>>> getEmployees() async {
    try {
      final remoteEmployees = await remoteDataSource.getEmployees();

      // Cache remote employees to local storage for persistence
      if (remoteEmployees.isNotEmpty) {
        await localDataSource.cacheAllEmployees(remoteEmployees);
      }

      final localEmployees = await localDataSource.getCachedEmployees();

      final Map<String, AddEmployeeResponseEntity> allEmployees = {};

      // Merge local first, then remote (remote overrides local if duplicate)
      for (var emp in localEmployees) {
        if (emp.email != null) allEmployees[emp.email!] = emp;
      }

      for (var emp in remoteEmployees) {
        if (emp.email != null) allEmployees[emp.email!] = emp;
      }

      return Right(allEmployees.values.toList());
    } catch (e) {
      try {
        final localEmployees = await localDataSource.getCachedEmployees();
        if (localEmployees.isNotEmpty) {
          return Right(localEmployees);
        }
      } catch (_) {}
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
