import '../../data/models/attendance_response_model.dart';

abstract class AttendanceStates {
  final List<Map<String, dynamic>> logs;

  AttendanceStates({this.logs = const []});
}

class AttendanceInitialState extends AttendanceStates {
  AttendanceInitialState({super.logs});
}

class AttendanceLoadingState extends AttendanceStates {
  AttendanceLoadingState({super.logs});
}

class AttendanceDataUpdatedState extends AttendanceStates {
  AttendanceDataUpdatedState(List<Map<String, dynamic>> logs)
    : super(logs: logs);
}

class CheckInSuccessState extends AttendanceStates {
  final AttendanceResponseModel response;

  CheckInSuccessState(this.response, {super.logs});
}

class CheckOutSuccessState extends AttendanceStates {
  final AttendanceResponseModel response;

  CheckOutSuccessState(this.response, {super.logs});
}

class AttendanceErrorState extends AttendanceStates {
  final String message;

  AttendanceErrorState(this.message, {super.logs});
}
