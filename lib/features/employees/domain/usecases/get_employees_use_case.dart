import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/add_employee_response_entity.dart';
import '../repositories/employees_repository.dart';

@injectable
class GetEmployeesUseCase {
  final EmployeesRepository repository;

  GetEmployeesUseCase(this.repository);

  Future<Either<Failures, List<AddEmployeeResponseEntity>>> call() {
    return repository.getEmployees();
  }
}
