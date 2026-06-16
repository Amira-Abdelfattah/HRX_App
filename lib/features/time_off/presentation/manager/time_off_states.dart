import '../../../employees/domain/entities/add_employee_response_entity.dart';
import '../../domain/entities/time_off_request_entity.dart';
import '../../domain/entities/time_off_type_entity.dart';

abstract class TimeOffStates {}

class TimeOffInitialState extends TimeOffStates {}

class TimeOffLoadingState extends TimeOffStates {}

class TimeOffSuccessState extends TimeOffStates {
  final List<TimeOffTypeEntity> types;
  final List<AddEmployeeResponseEntity> employees;
  final List<TimeOffRequest> myRequests;

  TimeOffSuccessState({
    required this.types,
    required this.employees,
    required this.myRequests,
  });
}

class TimeOffErrorState extends TimeOffStates {
  final String message;

  TimeOffErrorState(this.message);
}

class TimeOffRequestLoadingState extends TimeOffStates {}

class TimeOffRequestSuccessState extends TimeOffStates {}

class TimeOffRequestErrorState extends TimeOffStates {
  final String message;

  TimeOffRequestErrorState(this.message);
}
