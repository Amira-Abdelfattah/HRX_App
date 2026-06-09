import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/add_employee_response_entity.dart';
import '../repositories/employees_repository.dart';

@injectable
class AddEmployeeUseCase {
  final EmployeesRepository repository;

  AddEmployeeUseCase(this.repository);

  Future<Either<Failures, AddEmployeeResponseEntity>> call({
    required String name,
    required String email,
    required String password,
    required String role,
    required String jobId,
  }) {
    return repository.addEmployee(
      name: name,
      email: email,
      password: password,
      role: role,
      jobId: jobId,
    );
  }
}
