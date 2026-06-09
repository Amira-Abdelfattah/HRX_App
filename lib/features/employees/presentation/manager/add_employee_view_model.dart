import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/add_employee_response_entity.dart';
import '../../domain/usecases/add_employee_use_case.dart';
import 'add_employee_states.dart';

@injectable
class AddEmployeeViewModel extends Cubit<AddEmployeeStates> {
  final AddEmployeeUseCase addEmployeeUseCase;

  AddEmployeeViewModel(this.addEmployeeUseCase)
    : super(AddEmployeeInitialState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController jobPositionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String selectedRole = 'employee';

  void changeRole(String role) {
    selectedRole = role;
    emit(AddEmployeeInitialState());
  }

  Future<void> addEmployee() async {
    if (!formKey.currentState!.validate()) return;

    emit(AddEmployeeLoadingState());

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final role = selectedRole;
    final jobId = jobPositionController.text.trim();

    final result = await addEmployeeUseCase.call(
      name: name,
      email: email,
      password: password,
      role: role,
      jobId: jobId,
    );

    result.fold(
      (failure) => emit(AddEmployeeErrorState(failure.errorMessage)),
      (employee) {
        final enrichedEmployee = AddEmployeeResponseEntity(
          status: employee.status,
          userId: employee.userId,
          name: (employee.name != null && employee.name!.isNotEmpty)
              ? employee.name
              : name,
          email: (employee.email != null && employee.email!.isNotEmpty)
              ? employee.email
              : email,
          role: (employee.role != null && employee.role!.isNotEmpty)
              ? employee.role
              : role,
          companyId: employee.companyId,
          jobId: (employee.jobId != null && employee.jobId!.isNotEmpty)
              ? employee.jobId
              : jobId,
        );
        emit(AddEmployeeSuccessState(enrichedEmployee));
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    jobPositionController.dispose();
    return super.close();
  }
}
