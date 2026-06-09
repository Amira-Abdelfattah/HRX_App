import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/flutter_toast.dart';
import '../../domain/usecases/register_use_case.dart';
import 'register_states.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;

  RegisterViewModel(this.registerUseCase) : super(RegisterInitialState());

  static RegisterViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController companyController = TextEditingController();
  String selectedRole = 'HR Manager';

  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(RegisterUpdateState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(RegisterUpdateState());
  }

  void changeRole(String role) {
    selectedRole = role;
    emit(RegisterUpdateState());
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      final result = await registerUseCase.call(
        fullName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: selectedRole,
        companyName: companyController.text,
      );

      result.fold(
        (failure) => emit(RegisterErrorState(failure.errorMessage)),
        (responseEntity) => emit(RegisterSuccessState(responseEntity)),
      );
    } else {
      ToastMessage.toastMsg("Please fill out all fields correctly");
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    companyController.dispose();
    return super.close();
  }
}
