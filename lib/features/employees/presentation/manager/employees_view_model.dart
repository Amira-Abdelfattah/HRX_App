import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/add_employee_response_entity.dart';
import '../../domain/usecases/get_employees_use_case.dart';
import 'employees_states.dart';

@injectable
class EmployeesViewModel extends Cubit<EmployeesStates> {
  final GetEmployeesUseCase getEmployeesUseCase;
  List<AddEmployeeResponseEntity> _allEmployees = [];

  EmployeesViewModel(this.getEmployeesUseCase) : super(EmployeesInitialState());

  Future<void> getEmployees() async {
    emit(EmployeesLoadingState());
    final result = await getEmployeesUseCase.call();
    result.fold((failure) => emit(EmployeesErrorState(failure.errorMessage)), (
      employees,
    ) {
      _allEmployees = employees;
      emit(EmployeesSuccessState(employees));
    });
  }

  void searchAndFilter({String? query, String? department}) {
    if (state is! EmployeesSuccessState &&
        state is! EmployeesLoadingState &&
        _allEmployees.isEmpty)
      return;

    List<AddEmployeeResponseEntity> filtered = _allEmployees;

    if (query != null && query.isNotEmpty) {
      filtered = filtered.where((emp) {
        final name = emp.name?.toLowerCase() ?? '';
        return name.contains(query.toLowerCase());
      }).toList();
    }

    if (department != null && department != 'All Departments') {
      filtered = filtered.where((emp) {
        String displayJob = 'General';
        try {
          if (emp.jobId is List && (emp.jobId as List).isNotEmpty) {
            displayJob = (emp.jobId as List).length > 1
                ? (emp.jobId as List)[1].toString()
                : (emp.jobId as List)[0].toString();
          } else if (emp.jobId != null && emp.jobId != false) {
            displayJob = emp.jobId.toString();
          }
        } catch (e) {
          displayJob = 'Employee';
        }
        return displayJob.toLowerCase() == department.toLowerCase();
      }).toList();
    }

    emit(EmployeesSuccessState(filtered));
  }
}
