import '../../domain/entities/add_employee_response_entity.dart';

abstract class AddEmployeeStates {}

class AddEmployeeInitialState extends AddEmployeeStates {}

class AddEmployeeLoadingState extends AddEmployeeStates {}

class AddEmployeeSuccessState extends AddEmployeeStates {
  final AddEmployeeResponseEntity employee;

  AddEmployeeSuccessState(this.employee);
}

class AddEmployeeErrorState extends AddEmployeeStates {
  final String message;

  AddEmployeeErrorState(this.message);
}
