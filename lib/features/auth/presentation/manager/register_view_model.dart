import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/register_use_case.dart';
import 'register_states.dart';

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
  final TextEditingController roleController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      final result = await registerUseCase.call(
        fullName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: roleController.text,
        companyName: companyController.text,
      );

      result.fold(
        (failure) => emit(RegisterErrorState(failure.errorMessage)),
        (responseEntity) => emit(RegisterSuccessState(responseEntity)),
      );
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    companyController.dispose();
    roleController.dispose();
    return super.close();
  }
}
