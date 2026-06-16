import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrx_app/core/cache/shared_prefrence_utils.dart';
import 'package:hrx_app/features/employees/domain/entities/add_employee_response_entity.dart';
import 'package:hrx_app/features/employees/domain/usecases/add_employee_use_case.dart';
import 'package:hrx_app/features/employees/presentation/manager/add_employee_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddEmployeeViewModel extends Cubit<AddEmployeeStates> {
  final AddEmployeeUseCase addEmployeeUseCase;

  AddEmployeeViewModel(this.addEmployeeUseCase)
      : super(AddEmployeeInitialState()) {
    _loadCompany();
  }

  void _loadCompany() {
    final savedCompany = SharedPreferenceUtils.getData(
        key: 'company_name') as String?;
    if (savedCompany != null && savedCompany != "false") {
      companyController.text = savedCompany;
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController jobPositionController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String selectedRole = 'user';

  void changeRole(String role) {
    selectedRole = role;
    emit(AddEmployeeUpdateState());
  }

  void resetState() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    jobPositionController.clear();
    _loadCompany();
    emit(AddEmployeeInitialState());
  }

  Future<void> addEmployee() async {
    try {
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
        companyName: companyController.text.trim(),
      );

      result.fold(
            (failure) => emit(AddEmployeeErrorState(failure.errorMessage)),
            (employee) {
          String? finalName = (employee.name != null && employee.name
              .toString()
              .isNotEmpty)
              ? employee.name.toString()
              : name;

          String? finalEmail = (employee.email != null && employee.email
              .toString()
              .isNotEmpty)
              ? employee.email.toString()
              : email;

          final enrichedEmployee = AddEmployeeResponseEntity(
            status: employee.status,
            userId: employee.userId,
            name: finalName,
            email: finalEmail,
            role: (employee.role != null)
                ? employee.role.toString()
                : role,
            companyId: employee.companyId,
            jobId: (employee.jobId != null && employee.jobId != false)
                ? employee.jobId
                : jobId,
          );
          emit(AddEmployeeSuccessState(enrichedEmployee));
        },
      );
    } catch (e) {
      emit(AddEmployeeErrorState(
          "An unexpected error occurred: ${e.toString()}"));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    jobPositionController.dispose();
    companyController.dispose();
    return super.close();
  }
}
