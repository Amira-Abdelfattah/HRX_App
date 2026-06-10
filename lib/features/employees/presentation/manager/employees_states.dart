import '../../domain/entities/add_employee_response_entity.dart';

abstract class EmployeesStates {}

class EmployeesInitialState extends EmployeesStates {}

class EmployeesLoadingState extends EmployeesStates {}

class EmployeesSuccessState extends EmployeesStates {
  final List<AddEmployeeResponseEntity> employees;

  EmployeesSuccessState(this.employees);
}

class EmployeesErrorState extends EmployeesStates {
  final String errorMessage;

  EmployeesErrorState(this.errorMessage);
}
