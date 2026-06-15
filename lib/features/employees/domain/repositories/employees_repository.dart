import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/add_employee_response_entity.dart';

abstract class EmployeesRepository {
  Future<Either<Failures, AddEmployeeResponseEntity>> addEmployee({
    required String name,
    required String email,
    required String password,
    required String role,
    required String jobId,
    required String companyName,
  });

  Future<Either<Failures, List<AddEmployeeResponseEntity>>> getEmployees();
}
