import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_prefrence_utils.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../employees/domain/repositories/employees_repository.dart';
import '../../domain/repositories/attendance_repository.dart';
import 'attendance_states.dart';

@injectable
class AttendanceCubit extends Cubit<AttendanceStates> {
  final AttendanceRepository repository;
  final EmployeesRepository employeesRepository;

  AttendanceCubit(this.repository, this.employeesRepository)
    : super(AttendanceInitialState(logs: []));

  Future<void> loadTodayAttendance() async {
    emit(AttendanceLoadingState(logs: state.logs));
    final result = await employeesRepository.getEmployees();

    result.fold(
      (failure) =>
          emit(AttendanceErrorState(failure.errorMessage, logs: state.logs)),
      (employees) {
        final List<Map<String, dynamic>> initialLogs = employees.map((emp) {
          return {
            'name': emp.name ?? 'Unknown',
            'in': '--:--',
            'out': '--:--',
            'hours': '--',
            'status': 'Absent',
            'color': AppColors.dangerColor,
            'id': emp.userId,
          };
        }).toList();
        emit(AttendanceDataUpdatedState(initialLogs));
      },
    );
  }

  Future<void> checkIn(int employeeId) async {
    final currentLogs = List<Map<String, dynamic>>.from(state.logs);
    emit(AttendanceLoadingState(logs: currentLogs));

    final result = await repository.checkIn(employeeId);

    result.fold(
      (error) => emit(AttendanceErrorState(error, logs: currentLogs)),
      (response) {
        // Find employee in logs and update their status
        int index = currentLogs.indexWhere((log) => log['id'] == employeeId);

        if (index != -1) {
          currentLogs[index] = {
            ...currentLogs[index],
            'in': response.checkIn ?? '--:--',
            'status': 'Present',
            'color': AppColors.successColor,
          };
        } else {
          // If not found (newly added and not reloaded), add them
          final userName =
              SharedPreferenceUtils.getData(key: 'user_name') as String? ??
              'New Employee';
          currentLogs.insert(0, {
            'name': userName,
            'in': response.checkIn ?? '--:--',
            'out': '--:--',
            'hours': '0.0h',
            'status': 'Present',
            'color': AppColors.successColor,
            'id': employeeId,
          });
        }

        emit(CheckInSuccessState(response, logs: currentLogs));
      },
    );
  }

  Future<void> checkOut(int employeeId) async {
    final currentLogs = List<Map<String, dynamic>>.from(state.logs);
    emit(AttendanceLoadingState(logs: currentLogs));

    final result = await repository.checkOut(employeeId);

    result.fold(
      (error) => emit(AttendanceErrorState(error, logs: currentLogs)),
      (response) {
        int index = currentLogs.indexWhere((log) => log['id'] == employeeId);

        if (index != -1) {
          currentLogs[index] = {
            ...currentLogs[index],
            'out': response.checkOut ?? '--:--',
            'hours': '${response.workedHours?.toStringAsFixed(1) ?? '0.0'}h',
          };
        }

        emit(CheckOutSuccessState(response, logs: currentLogs));
      },
    );
  }
}
